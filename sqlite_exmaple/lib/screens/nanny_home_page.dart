import 'package:flutter/material.dart';
import 'add_child_page.dart';
import '../db/database_helper.dart';
import '../models/child.dart';

class NannyHomePage extends StatefulWidget {
  @override
  _NannyHomePageState createState() => _NannyHomePageState();
}

class _NannyHomePageState extends State<NannyHomePage> {
  List<Child> _children = [];

  @override
  void initState() {
    super.initState();
    _refreshChildren();
  }

  void _refreshChildren() async {
    final children = await DatabaseHelper.instance.readAllChildren();
    setState(() {
      _children = children;
    });
  }

  void _navigateToAddChild() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddChildPage()),
    );
    if (result == true) {
      _refreshChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nanny Home Page'),
      ),
      body: ListView.builder(
        itemCount: _children.length,
        itemBuilder: (context, index) {
          final child = _children[index];
          return ListTile(
            title: Text(child.name),
            subtitle: Text('Age: ${child.age}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddChild,
        tooltip: 'Add Child',
        child: Icon(Icons.add),
      ),
    );
  }
}
