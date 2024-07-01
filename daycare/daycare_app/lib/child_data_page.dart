import 'package:flutter/material.dart';

class ChildDataPage extends StatelessWidget {
  final Map<String, String> childData;

  ChildDataPage({required this.childData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Center(
          child: Text('Child Data Details',
          style: TextStyle(fontWeight: FontWeight.bold)),
          ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Name'),
                subtitle: Text(childData['name'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Age'),
                subtitle: Text(childData['age'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Date'),
                subtitle: Text(childData['date'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Condition'),
                subtitle: Text(childData['condition'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Arrival'),
                subtitle: Text(childData['arrival'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Alergic'),
                subtitle: Text(childData['allergic'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Temprature'),
                subtitle: Text(childData['temperature'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Bottle'),
                subtitle: Text(childData['bottle'] ?? ''),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Milk Type'),
                subtitle: Text(childData['milktype'] ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}