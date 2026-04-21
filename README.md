# ShelfKeeper
(Previously written as PocketPantry)

A mobile pantry inventory app that helps you track what food you have at home so you don't accidentally buy things you already own.

## Features
- Add items with a name, category, and quantity
- View full inventory in a scrollable list
- Tap any item to see full details
- Search by name, filter by category, sort by name/category/date
- Edit and delete items
- All data saves locally — no internet required

## Software Required
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- VS Code with the Flutter and Dart extensions installed
- CocoaPods (for iOS) — install with `brew install cocoapods`

## How to Run
1. Clone the repo and open the `pocket_pantry` folder in VS Code
2. Open the terminal in VS Code and run:
```bash
   flutter pub get
   flutter run
```
3. Select your target device when prompted

## Tech Stack
- Flutter (Dart) — UI framework
- Hive — local on-device storage