import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
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

  AnotherPage({
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
    required Map<String, dynamic> childInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meals:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildDataTable(mealsList),
              SizedBox(height: 20),
              Text(
                'Toilet:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              _buildDataTable(toiletList),
              SizedBox(height: 20),
              Text(
                'Bottle:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
                  color: Colors.black,
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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(notesForParents),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable(List<Map<String, dynamic>> dataList) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
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
