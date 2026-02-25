import 'package:flutter/material.dart';
import 'pantry_box.dart';
import 'pantry_item.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen>{
  List<PantryItem> items = [];

  @override
  void initState(){
    super.initState();
    loadItems();
  }

  void loadItems(){
    setState(() {
      items =PantryBox.getAllItems();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: const Text('PocketPantry'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              //Navigate to Add Item screen
            }
          )
        ],
      ),

      body: items.isEmpty
          ? const Center(
              child: Text('No items yet. Tap + to add some!'),
            )
          : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.category),
                trailing: Text('Qty: ${item.quantity}'),
                );
            },
          ),

    );
  }
}
