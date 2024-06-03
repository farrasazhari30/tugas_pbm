import 'package:flutter/material.dart';
import 'parent_act_analysis.dart';

class CaregiverActivityPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  CaregiverActivityPage(this.navigatorKey,
      {required String userEmail,
      required String childGender,
      required Map childInfo});

  @override
  _CaregiverActivityPageState createState() => _CaregiverActivityPageState();
}

class _CaregiverActivityPageState extends State<CaregiverActivityPage> {
  // Controllers untuk input field
  final TextEditingController mealTypeController = TextEditingController();
  final TextEditingController mealFoodController = TextEditingController();
  final TextEditingController mealQuantityController = TextEditingController();
  final TextEditingController toiletTimeController = TextEditingController();
  final TextEditingController toiletTypeController = TextEditingController();
  final TextEditingController toiletConditionController =
      TextEditingController();
  final TextEditingController toiletNotesController = TextEditingController();
  final TextEditingController bottleTimeController = TextEditingController();
  final TextEditingController bottleMLController = TextEditingController();
  final TextEditingController bottleTypeController = TextEditingController();
  final TextEditingController othersController = TextEditingController();
  final TextEditingController notesForParentsController =
      TextEditingController();

  // List untuk menyimpan data
  List<Map<String, dynamic>> mealsList = [];
  List<Map<String, dynamic>> toiletList = [];
  List<Map<String, dynamic>> bottleList = [];
  List<Map<String, dynamic>> othersList = [];

  // Fungsi untuk menambahkan data meals ke dalam list
  void addMeal() {
    String type = mealTypeController.text.trim();
    String food = mealFoodController.text.trim();
    String quantity = mealQuantityController.text.trim();

    if (type.isNotEmpty && food.isNotEmpty && quantity.isNotEmpty) {
      setState(() {
        mealsList.add({
          'type': type,
          'food': food,
          'quantity': quantity,
        });
      });

      // Clear input fields setelah ditambahkan
      mealTypeController.clear();
      mealFoodController.clear();
      mealQuantityController.clear();
    }
  }

  // Fungsi untuk menambahkan data toilet ke dalam list
  void addToilet() {
    String time = toiletTimeController.text.trim();
    String type = toiletTypeController.text.trim();
    String condition = toiletConditionController.text.trim();
    String notes = toiletNotesController.text.trim();

    if (time.isNotEmpty && type.isNotEmpty && condition.isNotEmpty) {
      setState(() {
        toiletList.add({
          'time': time,
          'type': type,
          'condition': condition,
          'notes': notes,
        });
      });

      // Clear input fields setelah ditambahkan
      toiletTimeController.clear();
      toiletTypeController.clear();
      toiletConditionController.clear();
      toiletNotesController.clear();
    }
  }

  // Fungsi untuk menambahkan data bottle ke dalam list
  void addBottle() {
    String time = bottleTimeController.text.trim();
    String ml = bottleMLController.text.trim();
    String type = bottleTypeController.text.trim();

    if (time.isNotEmpty && ml.isNotEmpty && type.isNotEmpty) {
      setState(() {
        bottleList.add({
          'time': time,
          'ml': ml,
          'type': type,
        });
      });

      // Clear input fields setelah ditambahkan
      bottleTimeController.clear();
      bottleMLController.clear();
      bottleTypeController.clear();
    }
  }

  // Fungsi untuk menambahkan data others ke dalam list
  void addOthers() {
    String data = othersController.text.trim();

    if (data.isNotEmpty) {
      setState(() {
        othersList.add({
          'data': data,
        });
      });

      // Clear input fields setelah ditambahkan
      othersController.clear();
    }
  }

  @override
  void dispose() {
    mealTypeController.dispose();
    mealFoodController.dispose();
    mealQuantityController.dispose();
    toiletTimeController.dispose();
    toiletTypeController.dispose();
    toiletConditionController.dispose();
    toiletNotesController.dispose();
    bottleTimeController.dispose();
    bottleMLController.dispose();
    bottleTypeController.dispose();
    othersController.dispose();
    notesForParentsController.dispose();
    super.dispose();
  }

  void saveActivityData() {
    // Data sudah disimpan dalam list, tidak ada tindakan tambahan yang diperlukan di sini
    print('Activity data saved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blue[50], // Menambahkan warna latar belakang biru muda
      appBar: AppBar(
        title: Text('INPUT CHILD DATA AND ACTIVITY'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Warna biru untuk AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              Text(
                'Meals',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Warna teks biru lebih gelap
                ),
              ),
              SizedBox(height: 10.0),
              _buildMealForm(),
              SizedBox(height: 10.0),
              // Tabel Meals
              _buildDataTable(
                columns: [
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('Food')),
                  DataColumn(label: Text('Quantity')),
                ],
                rows: mealsList
                    .map(
                      (meal) => DataRow(
                        cells: [
                          DataCell(Text(meal['type'])),
                          DataCell(Text(meal['food'])),
                          DataCell(Text(meal['quantity'])),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Toilet',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Warna teks biru lebih gelap
                ),
              ),
              SizedBox(height: 10.0),
              _buildToiletForm(),
              SizedBox(height: 10.0),
              // Tabel Toilet
              _buildDataTable(
                columns: [
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Type')),
                  DataColumn(label: Text('Condition')),
                  DataColumn(label: Text('Notes')),
                ],
                rows: toiletList
                    .map(
                      (toilet) => DataRow(
                        cells: [
                          DataCell(Text(toilet['time'])),
                          DataCell(Text(toilet['type'])),
                          DataCell(Text(toilet['condition'])),
                          DataCell(Text(toilet['notes'])),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Bottle',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Warna teks biru lebih gelap
                ),
              ),
              SizedBox(height: 10.0),
              _buildBottleForm(),
              SizedBox(height: 10.0),
              // Tabel Bottle
              _buildDataTable(
                columns: [
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('ML')),
                  DataColumn(label: Text('Type')),
                ],
                rows: bottleList
                    .map(
                      (bottle) => DataRow(
                        cells: [
                          DataCell(Text(bottle['time'])),
                          DataCell(Text(bottle['ml'])),
                          DataCell(Text(bottle['type'])),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Others',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Warna teks biru lebih gelap
                ),
              ),
              SizedBox(height: 10.0),
              _buildOthersForm(),
              SizedBox(height: 10.0),
              // Tabel Others
              _buildDataTable(
                columns: [
                  DataColumn(label: Text('Data')),
                ],
                rows: othersList
                    .map(
                      (others) => DataRow(
                        cells: [
                          DataCell(Text(others['data'])),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Notes for My Parents',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Warna teks biru lebih gelap
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: notesForParentsController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  filled: true,
                  fillColor:
                      Colors.white, // Warna latar belakang input field putih
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Simpan data aktivitas
                  saveActivityData();

                  // Navigasi ke halaman analisis orang tua setelah aktivitas disimpan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParentActivityAnalysisPage(
                        mealsList: mealsList,
                        toiletList: toiletList,
                        bottleList: bottleList,
                        othersList: othersList,
                        notesForParents: notesForParentsController.text,
                        childDate: '',
                        childName: '',
                        childAge: '',
                        childGender: '',
                        childCondition: '',
                        activity: '',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Save Activity'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun form meals
  Widget _buildMealForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: mealTypeController,
          decoration: InputDecoration(
            labelText: 'Type',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: mealFoodController,
          decoration: InputDecoration(
            labelText: 'Food',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: mealQuantityController,
          decoration: InputDecoration(
            labelText: 'Quantity',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: addMeal,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Warna biru untuk tombol
          ),
          child: Text('Add Meal'),
        ),
      ],
    );
  }

  // Fungsi untuk membangun form toilet
  Widget _buildToiletForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: toiletTimeController,
          decoration: InputDecoration(
            labelText: 'Time',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: toiletTypeController,
          decoration: InputDecoration(
            labelText: 'Type',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: toiletConditionController,
          decoration: InputDecoration(
            labelText: 'Condition',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: toiletNotesController,
          decoration: InputDecoration(
            labelText: 'Notes',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: addToilet,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Warna biru untuk tombol
          ),
          child: Text('Add Toilet'),
        ),
      ],
    );
  }

  // Fungsi untuk membangun form bottle
  Widget _buildBottleForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: bottleTimeController,
          decoration: InputDecoration(
            labelText: 'Time',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: bottleMLController,
          decoration: InputDecoration(
            labelText: 'ML',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: bottleTypeController,
          decoration: InputDecoration(
            labelText: 'Type',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: addBottle,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Warna biru untuk tombol
          ),
          child: Text('Add Bottle'),
        ),
      ],
    );
  }

  // Fungsi untuk membangun form others
  Widget _buildOthersForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: othersController,
          decoration: InputDecoration(
            labelText: 'Data',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: addOthers,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Text('Add Others'),
        ),
      ],
    );
  }

  // Fungsi untuk membangun tabel data
  Widget _buildDataTable({
    required List<DataColumn> columns,
    required List<DataRow> rows,
  }) {
    return DataTable(
      columns: columns,
      rows: rows,
      columnSpacing: 20,
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Colors.blue[200]!, // Warna biru muda untuk heading
      ),
      dataRowColor: MaterialStateColor.resolveWith(
        (states) => Colors.blue[50]!,
      ),
    );
  }
}
