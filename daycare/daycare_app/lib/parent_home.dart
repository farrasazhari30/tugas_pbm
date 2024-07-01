import 'package:flutter/material.dart';
import 'child_data_input_page.dart';
import 'child_data_page.dart';
import 'child_activity_page.dart';

class ParentHome extends StatefulWidget {
  @override
  _ParentHomeState createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  List<Map<String, String>> children = [];
  List<Map<String, String>> activities = [
    {
      'name': 'Louis',
      'date': '2024-05-01',
      'temperature': '36.2',
      'condition': 'Good',
      'breakfast': 'Cereal',
      'snack': 'Apple',
      'lunch': 'Sandwich',
      'dinner': 'Pasta',
      'other': 'None',
      'toilettimes': '2',
      'toilettype': 'Diapers',
      'sports': 'Soccer',
      'naptime': '2 hours',
      'bottletimes': '2',
      'bottletype': 'Milk',
      'shower_afternoon': '16.00',
      'vitamin': 'Yes',
      'itemsneeded': 'item_needed_Toothpaste',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Home'),
        backgroundColor: Colors.orange[300], 
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon panah kembali
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login'); // Mengarahkan kembali ke halaman login
          },
        ),
      ),
      body: Container(
        color: Colors.white, 
        child: ListView(
          children: [
            ...children.map((child) {
              return Card(
                elevation: 3, 
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), 
                child: ListTile(
                  title: Text(child['name']!),
                  subtitle: Text('Age: ${child['age']} - Arrival: ${child['arrival']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildDataPage(childData: child),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            SizedBox(height: 16), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChildActivityPage(activityData: activities[0]), 
                    ),
                  );
                },
                child: Text('View Child Activity', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[300], 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newChild = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChildDataInputPage()),
          );
          if (newChild != null) {
            setState(() {
              children.add(newChild);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[300], 
      ),
    );
  }
}
