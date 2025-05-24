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

  toggleEdit() {
    this.weightDisplayTarget.style.display = "none";
    this.heightDisplayTarget.style.display = "none";

    this.weightInputTarget.style.display = "inline-block";
    this.heightInputTarget.style.display = "inline-block";

    this.editBtnTarget.style.display = "none";
    this.saveBtnTarget.style.display = "inline-block";
  }

  save() {
    const weight = this.weightInputTarget.value;
    const height = this.heightInputTarget.value;

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
        if (!response.ok) throw new Error("Network error");
        return response.json();
      })
      .then((data) => {
        this.weightDisplayTarget.textContent = data.weight;
        this.heightDisplayTarget.textContent = data.height;

        this.weightDisplayTarget.style.display = "inline";
        this.heightDisplayTarget.style.display = "inline";

        this.weightInputTarget.style.display = "none";
        this.heightInputTarget.style.display = "none";

        this.editBtnTarget.style.display = "inline-block";
        this.saveBtnTarget.style.display = "none";
      })
      .catch(() => alert("Failed to save changes"));
  }
}
