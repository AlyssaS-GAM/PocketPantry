import 'package:flutter/material.dart';
import 'pantry_box.dart';
import 'pantry_item.dart';

class AddItemScreen extends StatefulWidget{
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen>{
  final _nameController = TextEditingController();
  final _catgoryController = TextEditingController();
  final _quantityController = TextEditingController();

  void saveItem(){
    if (_nameController.text.isEmpty ||
        _catgoryController.text.isEmpty ||
        _quantityController.text.isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill in all required fields')),
          );
          return;
        }

  final newItem = PantryItem(
    name: _nameController.text, 
    category: _catgoryController.text, 
    quantity: int.parse(_quantityController.text), 
    dateAdded: DateTime.now(),
  );
   PantryBox.saveItem(newItem);
   Navigator.pop(context);
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: saveItem, 
            child: const Text('Save Item'),
            ),
          ],
        ),
      ),
    );
  }
}
