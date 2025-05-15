# AI-Powered Virtual Fashion Stylist 👗🧠

This is a smart web-based fashion assistant that helps users choose outfits based on their skin undertone (warm, cool, or neutral). The system recommends clothing colors and displays matching products from the database.

---

## ✅ Features Completed

- 🎨 Undertone-based Color Palette Assignment
- 🛍️ Product Recommendations Matching User Undertone
- 🔗 Web Frontend for Viewing Recommendations
- 📦 Rails Backend API with PostgreSQL
- 🌐 Admin Panel to Manage Users and Products (Basic)

---

## 🧰 Tech Stack (Completed)

| Component   | Technology            |
|------------|------------------------|
| Backend    | Ruby on Rails (API)    |
| Frontend   | React.js               |
| Database   | PostgreSQL             |
| AI Logic   | Ruby (Controller-based mapping) |

---

## 📂 Project Structure

stylist-app/
├── backend/
│ ├── app/controllers/users_controller.rb
│ └── models/user.rb, product.rb
├── frontend/
│ ├── src/components/
│ └── src/pages/Palette.js
├── db/
│ └── seeds.rb (with sample products)
├── public/
│ └── images/


---

## 🧪 How to Run

### Backend (Rails API)
```bash
cd backend
bundle install
rails db:create db:migrate db:seed
rails server

 Example Use Case
A user signs up and selects their undertone as "Cool". The system fetches a matching color palette (e.g., sky blue, lavender) and displays products from the database in those shades.
🔗 Related Project
Check out my supporting project used for data collection:
📄 Fashion Brand Web Scrapers (Python + Selenium)
This repo contains scripts that scrape product data (name, color, price, image, and link) from different Pakistani fashion brand websites.

