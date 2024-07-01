import 'database_helper.dart';
import 'item_page.dart';

class ItemOperations {
  static Future<void> addItem() async {
    await DatabaseHelper.instance
        .create(Item(name: 'Baru', description: 'Item baru'));
  }

  static Future<Item> getItem(int id) async {
    return await DatabaseHelper.instance.read(id);
  }

  static Future<void> updateItem(int id) async {
    await DatabaseHelper.instance.update(
        Item(id: id, name: 'Diperbarui', description: 'Item diperbarui'));
  }

  static Future<void> deleteItem(int id) async {
    await DatabaseHelper.instance.delete(id);
  }
}