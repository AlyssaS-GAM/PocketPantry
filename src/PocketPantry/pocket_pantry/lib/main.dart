import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pantry_item.dart';

void main() async{ //app shouldnt start till hive is ready
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PantryItemAdapter());
  await Hive.openBox<PantryItem>('pantryItems');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pocket Pantry'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: (){
                // To be added
              },
            )
          ],
        )
      ),
    );
  }
}
