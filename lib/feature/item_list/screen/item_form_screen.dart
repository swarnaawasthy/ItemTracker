import 'package:flutter/material.dart';
import 'package:item_tracker/feature/item_list/provider/item_provider.dart';
import 'package:provider/provider.dart';

class ItemFormScreen extends StatelessWidget {
  final int? itemIndex;
  final bool isEditing;

  ItemFormScreen({super.key, this.itemIndex, this.isEditing = false});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    if (isEditing && itemIndex != null) {
      final item = itemProvider.items[itemIndex!];
      _nameController.text = item.name;
      _descriptionController.text = item.description;
    }

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Item' : 'Add Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => value!.isEmpty ? 'Enter a description' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(isEditing ? 'Update' : 'Add'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isEditing && itemIndex != null) {
                      itemProvider.editItem(
                        itemIndex!,
                        _nameController.text,
                        _descriptionController.text,
                      );
                    } else {
                      itemProvider.addItem(
                        _nameController.text,
                        _descriptionController.text,
                      );
                    }
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
