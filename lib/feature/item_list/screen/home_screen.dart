import 'package:flutter/material.dart';
import 'package:item_tracker/feature/item_list/provider/item_provider.dart';
import 'package:item_tracker/feature/item_list/screen/item_form_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Item Tracker', style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),)),
      body: itemProvider.items.isEmpty
          ? const Center(
              child: Text(
                'No items added yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
        itemCount: itemProvider.items.length,
        itemBuilder: (context, index) {
          final item = itemProvider.items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            color: const Color(0xFFE6E6FA),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF91A3B0)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemFormScreen(
                          itemIndex: index,
                          isEditing: true,
                        ),
                      ),
                    ),
                  ),
                  IconButton(

                    icon: const Icon(Icons.delete, color: Color(0xFFF4A7A3)),
                    onPressed: () => itemProvider.removeItem(index),
                  ),
                ],
              ),
            )

          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemFormScreen()),
        ),
      ),
    );
  }
}
