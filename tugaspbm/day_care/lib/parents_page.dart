import 'package:flutter/material.dart';

class ParentPage extends StatefulWidget {
  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final TextEditingController _conditionController = TextEditingController();
  List<Map<String, dynamic>> _savedData = [];

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _conditionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> childData = {
        'name': _nameController.text,
        'gender': _genderController.text,
        'date':
            '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
        'arrival': '${_selectedTime.hour}:${_selectedTime.minute}',
        'condition': _conditionController.text,
      };

      setState(() {
        _savedData.add(childData);
      });

      print(childData);
      // Here you could send the data to a backend or store it locally

      // Clear the form fields after submission
      _nameController.clear();
      _genderController.clear();
      _conditionController.clear();
    }
  }

  void _goToDailyReport() {
    if (_savedData.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/daily-report',
        arguments: _savedData,
      );
    } else {
      // Show a message if no data is available
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No data available to show the report')),
      );
    }
  }

  void _goBackToLogin() {
    // Navigate back to login page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Child Data'),
        backgroundColor: Colors.green[100],
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _goBackToLogin,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[100]!,
              Colors.green[50]!
            ], // Warna latar belakang halaman
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Child\'s Name',
                  labelStyle:
                      TextStyle(color: Colors.green), // Warna teks label
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 150, 237, 153)), // Warna border
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.green),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the child\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  prefixIcon: Icon(Icons.people_alt, color: Colors.green),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the child\'s gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                      style: TextStyle(color: Colors.green), // Warna teks
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,
                            color: Colors.green), // Simbol ikon kalender
                        SizedBox(width: 5),
                        Text(
                          'Select Date',
                          style: TextStyle(
                              color: Colors.green), // Warna teks tombol
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Arrival: ${_selectedTime.hour}:${_selectedTime.minute}',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectTime(context),
                    child: Row(
                      children: [
                        Icon(Icons.access_time,
                            color: Colors.green), // Simbol ikon jam
                        SizedBox(width: 5),
                        Text(
                          'Select Time',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _conditionController,
                decoration: InputDecoration(
                  labelText: 'Child\'s Condition',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  prefixIcon: Icon(Icons.medical_services,
                      color: Colors.green), // Simbol ikon kondisi
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the child\'s condition';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Save Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _goToDailyReport,
                child: Text('View Daily Report'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
