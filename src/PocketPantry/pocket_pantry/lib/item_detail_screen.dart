import 'package:flutter/material.dart';
import 'pantry_item.dart';

class ItemDetailScreen extends StatelessWidget {
  final PantryItem item;
  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.name}'),
            const SizedBox(height: 8),
            Text('Category: ${item.category}'),
            const SizedBox(height: 8),
            Text('Quantity: ${item.quantity}'),
            const SizedBox(height: 8),
            Text('Date Added: ${item.dateAdded.toString().split(' ')[0]}'),
            const SizedBox(height: 8),
            Text('Expiration Date: ${item.expirationDate?.toString().split(' ')[0] ?? 'Not set'}'),
            const SizedBox(height: 8),
            Text('Notes: ${item.notes ?? 'None'}'),
          ],
        ),
      ),
    );
  }
}