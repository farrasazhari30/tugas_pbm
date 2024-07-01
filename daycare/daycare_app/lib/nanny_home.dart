import 'package:flutter/material.dart';
import 'activity_input_page.dart';
import 'child_activity_page.dart';
import 'child_data_page.dart';

class NannyHome extends StatefulWidget {
  @override
  _NannyHomeState createState() => _NannyHomeState();
}

class _NannyHomeState extends State<NannyHome> {
  List<Map<String, String>> activities = [];
  List<Map<String, String>> children = [
    {
      'name': 'Louis',
      'age': '3',
      'date': '2024-05-01',
      'condition': 'Good',
      'arrival': '08:10 AM',
      'allergic': 'Fish',
      'temperature': '36.5',
      'bottle': '2 times a day',
      'milktype': 'Formula',
    },
    // Tambahkan data dummy lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nanny Home'),
        backgroundColor: Colors.orange[300], // Ganti warna appbar menjadi green
      ),
      body: Container(
        color: Colors.white, // Ganti warna latar belakang body menjadi putih
        child: ListView(
          children: [
            ...activities.map((activity) {
              return Card(
                elevation: 3, // Tambahkan elevasi kartu untuk memberikan bayangan
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Atur margin untuk kartu
                child: ListTile(
                  title: Text(activity['name']!),
                  subtitle: Text('Date: ${activity['date']} - Condition: ${activity['condition']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildActivityPage(activityData: activity),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            SizedBox(height: 16), // Tambahkan jarak antara daftar aktivitas dan tombol
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChildDataPage(childData: children[0]), // Mengambil data anak pertama untuk contoh
                    ),
                  );
                },
                child: Text('View Child Data', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400], // Ubah warna tombol menjadi green
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
          final newActivity = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivityInputPage()),
          );
          if (newActivity != null) {
            setState(() {
              activities.add(newActivity);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[400], // Ubah warna tombol tambah menjadi green
      ),
    );
  }
}