import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pantry_item.dart';
import 'inventory_screen.dart';

void main() async{ //app shouldnt start till hive is ready
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PantryItemAdapter());
  await Hive.openBox<PantryItem>('pantryItems');

  /* FOR TESTING SAVING AND LOADING ITEMS 
  
  import 'pantry_box.dart';

  PantryBox.saveItem(PantryItem(
    name: 'Test Apple',
    category: 'Produce',
    quantity: 3,
    dateAdded: DateTime.now(),
  ));

  final items = PantryBox.getAllItems();
  print('Items in box: ${items.length}');
  print('First item: ${items.first.name}');

 */

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InventoryScreen(),
    );
  }
}
