import 'package:flutter/material.dart';

class ParentActivityAnalysisPage extends StatelessWidget {
  final List<Map<String, dynamic>> mealsList;
  final List<Map<String, dynamic>> toiletList;
  final List<Map<String, dynamic>> bottleList;
  final List<Map<String, dynamic>> othersList;
  final String notesForParents;
  final String childDate;
  final String childName;
  final String childAge;
  final String childGender;
  final String childCondition;

  ParentActivityAnalysisPage({
    required this.mealsList,
    required this.toiletList,
    required this.bottleList,
    required this.othersList,
    required this.notesForParents,
    required this.childDate,
    required this.childName,
    required this.childAge,
    required this.childGender,
    required this.childCondition,
    required String activity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DAILY REPORT'),
        centerTitle: true,
        backgroundColor:
            Colors.lightBlue, // Mengubah warna AppBar menjadi biru muda
      ),
      body: Stack(
        alignment: Alignment.center, // Mengatur posisi konten di tengah
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(60.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[200], // Warna latar belakang seperti kertas
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Meals:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .black, // Warna teks biru lebih gelap
                                ),
                              ),
                              SizedBox(height: 10),
                              _buildDataTable(mealsList),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Toilet:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .black, // Warna teks biru lebih gelap
                                ),
                              ),
                              SizedBox(height: 10),
                              _buildDataTable(toiletList),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bottle:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks biru lebih gelap
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildDataTable(bottleList),
                    SizedBox(height: 20),
                    Text(
                      'Others:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks biru lebih gelap
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildDataTable(othersList),
                    SizedBox(height: 20),
                    Text(
                      'Notes for Parents:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks biru lebih gelap
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(notesForParents),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: ElevatedButton(
              onPressed: () {
                // Implement your saving logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna biru untuk tombol
              ),
              child: Text('Save and Continue'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable(List<Map<String, dynamic>> dataList) {
    return Container(
      width: double.infinity,
      child: dataList.isEmpty
          ? Text('No data', style: TextStyle(color: Colors.black))
          : DataTable(
              columnSpacing: 20.0,
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              headingTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              dataRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              columns: dataList.first.keys.map((String key) {
                return DataColumn(
                    label: Text(key, style: TextStyle(color: Colors.black)));
              }).toList(),
              rows: dataList.map((Map<String, dynamic> data) {
                return DataRow(
                    cells: data.keys.map((String key) {
                  return DataCell(Text('${data[key]}',
                      style: TextStyle(color: Colors.black)));
                }).toList());
              }).toList(),
            ),
    );
  }
}

