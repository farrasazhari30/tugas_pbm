import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'item_page.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    refreshItems();
  }

  Future refreshItems() async {
    this.items = await DatabaseHelper.instance.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await DatabaseHelper.instance.delete(item.id!);
                refreshItems();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await DatabaseHelper.instance.create(
            Item(name: 'New Item', description: 'New Description'),
          );
          refreshItems();
        },
      ),
    );
  }
}