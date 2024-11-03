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
      appBar: AppBar(title: const Text('Item Tracker')),
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
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
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
                  icon: const Icon(Icons.delete),
                  onPressed: () => itemProvider.removeItem(index),
                ),
              ],
            ),
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
