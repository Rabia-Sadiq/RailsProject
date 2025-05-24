## 📊 Project Completion Status

| Submission Phase | Tasks Completed | Completion |
|------------------|------------------|------------|
| ✅ **Submission 1** | 9 out of 9 (UI partially done)|  70%** |
| 🕒 **Submission 2** | 4 out of 4 | 30%** |

> **🔢 Total Project Completion: 100%
> ** Remaining project: 0

---

## ✅ Completed Features
User Authentication: Signup and login functionality implemented using Devise in Ruby on Rails.

Undertone Quiz: A simple quiz that determines the user's skin undertone.

Color Palette Generator: Personalized color palette generated based on the quiz results.

Product Catalog: Dresses displayed in a grid layout and filtered according to the user’s color preferences.

Filtering and Sorting: Users can filter dresses by various criteria (price,brand) and sort products (by price).

Favorite Dresses: Users can add dresses to their favorites and remove them from the favorites list.

Backend (Rails): All necessary models, controllers, and business logic implemented to support the features.

Database Design (PostgreSQL): Tables created for users, products, quiz results, palettes, and favorites.

Testing: Automated tests added to verify key features like user signup/login, quiz functionality, filtering, product management, and favorite dress functionality work correctly and reliably.

- AI-Powered Chatbot Stylist using local model (no external API pressure)
- Mood-based outfit suggestion UI (basic version)
- 🌤️ Weather-based Outfit of the Day (OOTD) – suggests colors and outfits based on current weather in user’s city
- UI Design:** Basic layout using grid for dresses; overall UI is still minimal and needs polish.
- Frontend Styling:** Tailwind used, but not fully structured or responsive.
- Responsiveness:** Mobile-friendly design is pending.
- Full application testing and bug fixing.


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

