import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/feature/item_list/provider/item_provider.dart';

void main() {
  group('ItemProvider Tests', () {
    test('Add item', () {
      final provider = ItemProvider();
      provider.addItem('Test Item', 'Test Description');

      expect(provider.items.length, 1);
      expect(provider.items[0].name, 'Test Item');
      expect(provider.items[0].description, 'Test Description');
    });

    test('Edit item', () {
      final provider = ItemProvider();
      provider.addItem('Old Name', 'Old Description');
      provider.editItem(0, 'New Name', 'New Description');

      expect(provider.items[0].name, 'New Name');
      expect(provider.items[0].description, 'New Description');
    });

    test('Remove item', () {
      final provider = ItemProvider();
      provider.addItem('Item to Remove', 'Description');
      provider.removeItem(0);

      expect(provider.items.isEmpty, true);
    });
  });
}
