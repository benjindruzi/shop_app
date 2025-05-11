
**Shop App**

A simple Flutter-based shopping app demonstrating selection of products, a shopping cart, checkout form, and order confirmation screen.

---

## Project Structure

```
shop_app/
├── android/           # Native Android project files
├── ios/               # Native iOS project files
├── lib/               # Dart source code
│   ├── main.dart      # App entry point
│   ├── models/        # Data models (Product, Cart)
│   │   ├── product.dart
│   │   └── cart.dart
│   ├── screens/       # UI screens
│   │   ├── splash.dart
│   │   ├── home.dart
│   │   ├── product_details.dart
│   │   ├── cart.dart
│   │   ├── checkout.dart
│   │   └── confirmation.dart
│   └── widgets/       # Reusable widgets
│       ├── product_tile.dart
│       └── cart_item_tile.dart
├── pubspec.yaml       # Dependencies & assets
└── README.md          # Project overview and instructions
```

---

## Prerequisites

- Flutter SDK (>=3.7)
- Android Studio or VS Code with Flutter & Dart plugins
- For Android build: Android SDK & emulator or physical device

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/shop_app.git
   cd shop_app
   ```
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on web (Chrome) or on an Android emulator/device:
   ```bash
   flutter run
   ```

---

## Notes

- Products are stored in-memory via `lib/models/cart.dart`. No external database.
- To add new products, edit the `_products` list in `Cart._internal()`.
- All navigation and state live in Dart code; no platform-specific native changes.

---

## Author

Dr. Sabah Mohammed  
COMP5450 Mobile Programming

---

*Licensed under MIT*
