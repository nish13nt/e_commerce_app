# E-Commerce App (Flutter UI Prototype)

This is a simple **E-Commerce mobile application UI** built using **Flutter** and **Dart**.  
It was created while I was learning Flutter app development — focusing purely on **UI design, layout building, and widget management**.

The app is not connected to a backend or database; all product data and images are **hardcoded** for demonstration purposes.

---

## 🧭 Overview

The **E-Commerce App** is a front-end prototype that simulates a shopping experience with:

- Product listings
- Product detail screens
- Category-based browsing
- Add-to-cart mockup UI

The goal of this project was to understand **Flutter’s widget tree**, **state management basics**, and **responsive design principles** while building something visually functional.

---

## ✨ Features

- **Home Page** with product grid  
- **Product Details Page** with images, description, and price  
- **Category Filters** (static)  
- **Cart Page (UI only)**  
- **Modern e-commerce layout** similar to real-world shopping apps  
- **Smooth navigation using Flutter’s Navigator**  

---

## 🧰 Tech Stack

| Layer | Technology |
|-------|-------------|
| Framework | Flutter |
| Language | Dart |
| State Management | Basic setState() and widget tree control |
| UI Components | Custom Flutter Widgets |
| Assets | Locally stored images |
| Platform | Android / iOS |

---

## ⚙️ Setup / Installation

To run this app locally:

```bash
# Clone the repository
git clone https://github.com/nish13nt/e_commerce_app.git
cd e_commerce_app

# Get Flutter dependencies
flutter pub get

# Run the app
flutter run


lib/
├── main.dart                # Entry point
├── screens/
│   ├── home_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   └── category_screen.dart
├── widgets/
│   ├── product_card.dart
│   ├── custom_appbar.dart
│   └── category_tile.dart
└── data/
    └── product_data.dart    # Hardcoded product info & image URLs
