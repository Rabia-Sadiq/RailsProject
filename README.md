## 📊 Project Completion Status

| Submission Phase | Tasks Completed | Completion |
|------------------|------------------|------------|
| ✅ **Submission 1** | 6 out of 10 (UI partially done, no tests yet) | **60% of 70%** |
| 🕒 **Submission 2** | 0 out of 4 | **0% of 30%** |

> **🔢 Total Project Completion: 42%**

---

## ✅ Completed Features

- **User Authentication:** Signup and Login using Devise in Ruby on Rails.
- **Undertone Quiz:** Simple quiz implemented to determine the user's skin undertone.
- **Color Palette Generator:** Personalized palette shown based on quiz results.
- **Product Catalog:** Dresses shown in a grid layout and filtered by user’s color preference.
- **Backend (Rails):** Models, controllers, and logic implemented.
- **Database Design (PostgreSQL):** Tables created for users, products, quiz results, and palettes.

---

## ⚠️ In Progress / Partially Done

- **UI Design:** Basic layout using grid for dresses; overall UI is still minimal and needs polish.
- **Frontend Styling:** Tailwind used, but not fully structured or responsive.
- **Responsiveness:** Mobile-friendly design is pending.
- **Testing:** No automated tests added yet (authentication, quiz, etc.).

---

## ❌ Not Yet Started (Submission 2 Tasks)

- AI-based dress size recommendation (planned using OpenAI API with height/weight input).
- Wishlist/Favorites feature.
- Full application testing and bug fixing.
- Deployment to Render or Heroku.

---

## 📦 Dataset & Scraping

Since most Pakistani fashion brands do **not provide APIs**, I wrote **custom Python scripts using Selenium** to scrape product data such as:

- **Product Title**
- **Image**
- **Color**
- **Price**
- **Product Link**

Additionally, public datasets on Kaggle contained **only images and product titles**, so I could not use them directly. Therefore:

- ✅ I **collected real-time product data** from brand websites (like Sapphire, Junaid Jamshed, etc.).
- ✅ I wrote a **color detection script** to extract the dominant color from product images using Python and OpenCV/skimage libraries.

This allowed me to build a realistic product database with color-tagged clothing items to support the **color-matching** and **personalized palette** features in the app.
I have uploaded it on another repo https://github.com/Rabia-Sadiq/MyScrappers
---

## 🛠️ Tech Stack

- **Backend:** Ruby on Rails
- **Frontend:** Tailwind CSS (basic usage)
- **Database:** PostgreSQL
- **Authentication:** Devise
- **Web Scraping:** Python (Selenium)
- **Image Color Detection:** Python (OpenCV / scikit-image)

---

