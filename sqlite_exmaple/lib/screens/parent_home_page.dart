import 'package:flutter/material.dart';
import 'package:daycare_app/db/database_helper.dart';
import 'package:daycare_app/models/child.dart';

class ParentHomePage extends StatefulWidget {
  @override
  _ParentHomePageState createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Home Page'),
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
    );
  }
}
