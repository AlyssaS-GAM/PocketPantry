import 'package:flutter/material.dart';
import 'pantry_box.dart';
import 'pantry_item.dart';
import 'add_item_screen.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<PantryItem> items = [];
  List<PantryItem> filteredItems = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() {
    setState(() {
      items = PantryBox.getAllItems();
      filteredItems = items;
    });
  }

  void searchItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  String selectedCategory = 'All';

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        filteredItems = items;
      } else {
        filteredItems = items
            .where((item) => item.category == category)
            .toList();
      }
    });
  }

  List<String> getCategories() {
    final categories = items.map((item) => item.category).toSet().toList();
    categories.insert(0, 'All');
    return categories;
  }

  void sortItems(String sortBy) {
  setState(() {
    if (sortBy == 'Name') {
      filteredItems.sort((a, b) => a.name.compareTo(b.name));
    } else if (sortBy == 'Category') {
      filteredItems.sort((a, b) => a.category.compareTo(b.category));
    } else if (sortBy == 'Date') {
      filteredItems.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PocketPantry'),
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort, color: Colors.white),
            onSelected: sortItems,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Name', child: Text('Sort by Name')),
              const PopupMenuItem(value: 'Category', child: Text('Sort by Category')),
              const PopupMenuItem(value: 'Date', child: Text('Sort by Date')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddItemScreen()),
              );
              loadItems();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search items',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: searchItems,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getCategories().map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (_) => filterByCategory(category),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(
                    child: Text('No items found.'),
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.category),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Qty: ${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.teal),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddItemScreen(existingItem: item),
                                  ),
                                );
                                loadItems();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete Item'),
                                    content: Text(
                                        'Are you sure you want to delete ${item.name}?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  PantryBox.deleteItem(index);
                                  loadItems();
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}