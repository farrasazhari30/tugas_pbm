import 'package:flutter/material.dart';
import 'another_page.dart'; // Import halaman AnotherPage

class InputChildInformation extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  InputChildInformation(this.navigatorKey);

  final TextEditingController childNameController = TextEditingController();
  final TextEditingController childAgeController = TextEditingController();
  final TextEditingController childGenderController = TextEditingController();
  final TextEditingController childConditionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Child Information'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Column(
              children: [
                ChildInformationForm(
                  childNameController: childNameController,
                  childAgeController: childAgeController,
                  childGenderController: childGenderController,
                  childConditionController: childConditionController,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Mengirim data anak ke AnotherPage saat tombol ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnotherPage(
                          mealsList: [],
                          toiletList: [],
                          bottleList: [],
                          othersList: [],
                          notesForParents: '',
                          childDate: '',
                          childName: childNameController
                              .text, // Menggunakan hasil input untuk mengisi informasi anak
                          childAge: childAgeController.text,
                          childGender: childGenderController.text,
                          childCondition: childConditionController.text,
                          childInfo: {},
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildInformationForm extends StatelessWidget {
  final TextEditingController childNameController;
  final TextEditingController childAgeController;
  final TextEditingController childGenderController;
  final TextEditingController childConditionController;

  const ChildInformationForm({
    Key? key,
    required this.childNameController,
    required this.childAgeController,
    required this.childGenderController,
    required this.childConditionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Child Information',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: childNameController,
          decoration: InputDecoration(
            labelText: 'Child Name',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: childAgeController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Child Age',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: childGenderController,
          decoration: InputDecoration(
            labelText: 'Child Gender',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: childConditionController,
          decoration: InputDecoration(
            labelText: 'Child Condition',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
