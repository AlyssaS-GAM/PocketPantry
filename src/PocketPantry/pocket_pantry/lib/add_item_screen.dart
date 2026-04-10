import 'package:flutter/material.dart';
import 'pantry_box.dart';
import 'pantry_item.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _quantityController = TextEditingController();

  final _nameFocus = FocusNode();
  final _categoryFocus = FocusNode();
  final _quantityFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    _nameFocus.dispose();
    _categoryFocus.dispose();
    _quantityFocus.dispose();
    super.dispose();
  }

  void saveItem() {
    if (_nameController.text.isEmpty ||
        _categoryController.text.isEmpty ||
        _quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    final newItem = PantryItem(
      name: _nameController.text,
      category: _categoryController.text,
      quantity: int.parse(_quantityController.text),
      dateAdded: DateTime.now(),
    );
    PantryBox.saveItem(newItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
              focusNode: _nameFocus,
              decoration: const InputDecoration(labelText: 'Item Name'),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _categoryFocus.requestFocus(),
            ),
            TextField(
              controller: _categoryController,
              focusNode: _categoryFocus,
              decoration: const InputDecoration(labelText: 'Category'),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _quantityFocus.requestFocus(),
            ),
            TextField(
              controller: _quantityController,
              focusNode: _quantityFocus,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveItem,
              child: const Text('Save Item'),
            ),
          ],
        ),
      ),
    );
  }
}