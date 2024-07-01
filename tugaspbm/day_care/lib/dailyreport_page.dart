import 'package:flutter/material.dart';

class DailyReportPage extends StatelessWidget {
  final List<Map<String, dynamic>> savedData;
  final Map<String, dynamic> formData;

  DailyReportPage({
    required this.savedData,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    // Gunakan `formData` sesuai kebutuhan untuk menampilkan data dari child activity
    // Gunakan `savedData` untuk menampilkan data yang telah disimpan sebelumnya
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Report'),
        backgroundColor: Colors.green[100], 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[100]!,
              Colors.green[50]!
            ], 
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: savedData.isNotEmpty // Menampilkan pesan jika ada data tersimpan
            ? ListView(
                children: <Widget>[
                  const Text(
                    'Saved Data:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: savedData.map((data) {
                      return Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${data['name']}',
                                  style: TextStyle(color: Colors.green)),
                              Text('Gender: ${data['gender']}',
                                  style: TextStyle(color: Colors.green)),
                              Text('Date: ${data['date']}',
                                  style: TextStyle(color: Colors.green)),
                              Text('Arrival: ${data['arrival']}',
                                  style: TextStyle(color: Colors.green)),
                              Text('Condition: ${data['condition']}',
                                  style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'No saved data available.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
      ),
    );
  }
}
