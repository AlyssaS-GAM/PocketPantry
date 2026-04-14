# PocketPantry

A mobile app that helps you keep track of what food you have at home, so you never accidentally rebuy something you already own.

## What it does
- Add pantry items with a name, category, and quantity
- View your full inventory in a scrollable list
- Search items by name
- Filter items by category
- Sort items by name, category, or date added
- Edit existing items
- Delete items with a confirmation prompt
- All data saves locally on your phone — no internet required

## Tech Stack
- Flutter (Dart) — UI and app logic
- Hive — local on-device storage
- build_runner + hive_generator — auto-generates Hive adapter code

## Project Structure
- `lib/pantry_item.dart` - data model for a pantry item
- `lib/pantry_item.g.dart` - auto-generated Hive adapter (do not edit)
- `lib/pantry_box.dart` - storage helper functions
- `lib/main.dart` - app entry point and Hive setup
- `lib/inventory_screen.dart` - main screen
- `lib/add_item_screen.dart` - add and edit screen

## How to run
1. Clone the repo
2. Make sure Flutter is installed
3. Run:
      flutter pub get
      flutter run

## Notes
- Built as a school project milestone assignment
- Tested on iOS