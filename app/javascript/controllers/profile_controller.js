// app/javascript/controllers/profile_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "weightDisplay",
    "weightInput",
    "heightDisplay",
    "heightInput",
    "editBtn",
    "saveBtn"
  ];

  connect() {
    this.isEditing = false;
    this.originalWeight = this.weightDisplayTarget.textContent;
    this.originalHeight = this.heightDisplayTarget.textContent;
  }

  toggleEdit() {
    if (this.isEditing) {
      this.cancelEdit();
    } else {
      this.enterEditMode();
    }
  }

  enterEditMode() {
    this.isEditing = true;
    
    // Store original values in case we need to cancel
    this.originalWeight = this.weightDisplayTarget.textContent;
    this.originalHeight = this.heightDisplayTarget.textContent;
    
    // Set input values to current display values
    this.weightInputTarget.value = this.originalWeight;
    this.heightInputTarget.value = this.originalHeight;

    // Toggle visibility
    this.weightDisplayTarget.style.display = "none";
    this.heightDisplayTarget.style.display = "none";
    this.weightInputTarget.style.display = "inline-block";
    this.heightInputTarget.style.display = "inline-block";
    this.editBtnTarget.style.display = "none";
    this.saveBtnTarget.style.display = "inline-block";

    // Focus on first input
    this.weightInputTarget.focus();
    this.weightInputTarget.select();
  }

  cancelEdit() {
    this.isEditing = false;
    
    // Restore original values
    this.weightInputTarget.value = this.originalWeight;
    this.heightInputTarget.value = this.originalHeight;
    
    this.exitEditMode();
  }

  exitEditMode() {
    this.isEditing = false;
    
    // Toggle visibility back
    this.weightDisplayTarget.style.display = "inline";
    this.heightDisplayTarget.style.display = "inline";
    this.weightInputTarget.style.display = "none";
    this.heightInputTarget.style.display = "none";
    this.editBtnTarget.style.display = "inline-block";
    this.saveBtnTarget.style.display = "none";
    
    this.clearMessages();
  }

  save() {
    const weight = parseFloat(this.weightInputTarget.value);
    const height = parseFloat(this.heightInputTarget.value);

    // Validate inputs
    if (!this.validateInputs(weight, height)) {
      return;
    }

    // Disable save button during request
    this.saveBtnTarget.disabled = true;
    this.saveBtnTarget.textContent = "Saving...";

    fetch("/profile", {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
        "Accept": "application/json"
      },
      body: JSON.stringify({ user: { weight, height } })
    })
      .then((response) => {
        if (!response.ok) {
          return response.json().then(err => Promise.reject(err));
        }
        return response.json();
      })
      .then((data) => {
        // Update display values
        this.weightDisplayTarget.textContent = data.weight;
        this.heightDisplayTarget.textContent = data.height;
        
        // Update stored original values
        this.originalWeight = data.weight;
        this.originalHeight = data.height;

        this.exitEditMode();
        this.showSuccess("Profile updated successfully!");
      })
      .catch((error) => {
        console.error("Save error:", error);
        
        if (error.errors) {
          this.showError(error.errors.join(", "));
        } else {
          this.showError("Failed to save changes. Please try again.");
        }
      })
      .finally(() => {
        // Re-enable save button
        this.saveBtnTarget.disabled = false;
        this.saveBtnTarget.textContent = "Save Changes";
      });
  }

  validateInputs(weight, height) {
    this.clearMessages();
    
    if (isNaN(weight) || weight <= 0) {
      this.showError("Please enter a valid weight greater than 0");
      this.weightInputTarget.focus();
      return false;
    }
    
    if (isNaN(height) || height <= 0) {
      this.showError("Please enter a valid height greater than 0");
      this.heightInputTarget.focus();
      return false;
    }
    
    if (weight > 1000) {
      this.showError("Weight seems too high. Please check your input.");
      this.weightInputTarget.focus();
      return false;
    }
    
    if (height > 300) {
      this.showError("Height seems too high. Please check your input.");
      this.heightInputTarget.focus();
      return false;
    }
    
    return true;
  }

  // Handle Enter key to save, Escape key to cancel
  handleKeydown(event) {
    if (!this.isEditing) return;
    
    if (event.key === "Enter") {
      event.preventDefault();
      this.save();
    } else if (event.key === "Escape") {
      event.preventDefault();
      this.cancelEdit();
    }
  }

  showError(message) {
    this.clearMessages();
    const errorDiv = document.createElement("div");
    errorDiv.className = "error-message";
    errorDiv.textContent = message;
    errorDiv.style.cssText = `
      color: #d32f2f;
      font-size: 14px;
      margin-top: 10px;
      text-align: center;
      padding: 8px;
      background-color: #ffebee;
      border-radius: 4px;
      border: 1px solid #ffcdd2;
    `;
    this.element.appendChild(errorDiv);
  }

  showSuccess(message) {
    this.clearMessages();
    const successDiv = document.createElement("div");
    successDiv.className = "success-message";
    successDiv.textContent = message;
    successDiv.style.cssText = `
      color: #2e7d32;
      font-size: 14px;
      margin-top: 10px;
      text-align: center;
      padding: 8px;
      background-color: #e8f5e8;
      border-radius: 4px;
      border: 1px solid #c8e6c9;
    `;
    this.element.appendChild(successDiv);
    
    // Clear success message after 3 seconds
    setTimeout(() => {
      this.clearMessages();
    }, 3000);
  }

  clearMessages() {
    const messages = this.element.querySelectorAll(".error-message, .success-message");
    messages.forEach(msg => msg.remove());
  }
}