import 'package:flutter/material.dart';
import 'dailyreport_page.dart';
import 'login_page.dart';

class NannyPage extends StatefulWidget {
  @override
  _NannyPageState createState() => _NannyPageState();
}

class _NannyPageState extends State<NannyPage> {
  Map<String, dynamic> _formData = {
    'Date': '',
    'arrival': '',
    'childName': '',
    'childAge': '',
    'gender': '',
    'condition': '',
    'meals': [
      {'type': 'Breakfast', 'food': '', 'quantity': 'None'},
      {'type': 'Snack', 'food': '', 'quantity': 'None'},
      {'type': 'Lunch', 'food': '', 'quantity': 'None'},
      {'type': 'Dinner', 'food': '', 'quantity': 'None'},
      {'type': 'Fluids', 'food': '', 'quantity': 'None'},
    ],
    'toilets': [
      {'time': '', 'type': 'Diaper', 'condition': 'Dry'},
    ],
    'bottles': [
      {'time': '', 'ml': '', 'type': 'Breast'},
    ],
    'rests': [
      {'start': '', 'end': ''},
    ],
    'showers': [
      {'morning': '', 'afternoon': ''},
    ],
    'notes for my parents': '',
  };

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _arrivalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = _selectedDate.toString();
    _arrivalController.text = _selectedTime.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Child Activity'),
        backgroundColor: Colors.green[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.green[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Child Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Date & Arrival',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date: ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(
                            Icons.calendar_today), // Tambahkan ikon kalender
                      ),
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _dateController.text = _selectedDate.toString();
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Arrival',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon:
                            Icon(Icons.access_time), // Tambahkan ikon waktu
                      ),
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime,
                        );
                        if (pickedTime != null && pickedTime != _selectedTime) {
                          setState(() {
                            _selectedTime = pickedTime;
                            _arrivalController.text =
                                _selectedTime.format(context);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                initialValue: _formData['childName'],
                onChanged: (value) {
                  setState(() {
                    _formData['childName'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Child Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                initialValue: _formData['childAge'],
                onChanged: (value) {
                  setState(() {
                    _formData['childAge'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Child Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                initialValue: _formData['gender'],
                onChanged: (value) {
                  setState(() {
                    _formData['gender'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                initialValue: _formData['condition'],
                onChanged: (value) {
                  setState(() {
                    _formData['condition'] = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Condition',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Meals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _formData['meals'].length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      _formData['meals'][index]['type'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text('Food'),
                        subtitle: TextFormField(
                          initialValue: _formData['meals'][index]['food'],
                          onChanged: (value) {
                            setState(() {
                              _formData['meals'][index]['food'] = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Quantity'),
                        subtitle: DropdownButtonFormField<String>(
                          value: _formData['meals'][index]['quantity'],
                          onChanged: (newValue) {
                            setState(() {
                              _formData['meals'][index]['quantity'] = newValue!;
                            });
                          },
                          items: ['None', 'Some', 'Lots']
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Toilet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _formData['toilets'].length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      'Toilet ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text('Time'),
                        subtitle: TextFormField(
                          initialValue: _formData['toilets'][index]['time'],
                          onChanged: (value) {
                            setState(() {
                              _formData['toilets'][index]['time'] = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter time',
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Type'),
                        subtitle: DropdownButtonFormField<String>(
                          value: _formData['toilets'][index]['type'],
                          onChanged: (newValue) {
                            setState(() {
                              _formData['toilets'][index]['type'] = newValue!;
                            });
                          },
                          items: ['Diaper', 'Potty']
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),
                        ),
                      ),
                      ListTile(
                        title: Text('Condition'),
                        subtitle: DropdownButtonFormField<String>(
                          value: _formData['toilets'][index]['condition'],
                          onChanged: (newValue) {
                            setState(() {
                              _formData['toilets'][index]['condition'] =
                                  newValue!;
                            });
                          },
                          items: ['Dry', 'Wet', 'BM']
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bottle',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _formData['bottles'].length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      'Bottle ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Time'),
                        subtitle: TextFormField(
                          initialValue: _formData['bottles'][index]['time'],
                          onChanged: (value) {
                            setState(() {
                              _formData['bottles'][index]['time'] = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter time',
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('ml'),
                        subtitle: TextFormField(
                          initialValue: _formData['bottles'][index]['ml'],
                          onChanged: (value) {
                            setState(() {
                              _formData['bottles'][index]['ml'] = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter ml',
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Type'),
                        subtitle: DropdownButtonFormField<String>(
                          value: _formData['bottles'][index]['type'],
                          onChanged: (newValue) {
                            setState(() {
                              _formData['bottles'][index]['type'] = newValue!;
                            });
                          },
                          items: ['Breast', 'Formula', 'Milk']
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Rest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _formData['rests'].length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      'Rest ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text('Start'),
                        subtitle: TextFormField(
                          initialValue: _formData['rests'][index]['start'],
                          onChanged: (value) {
                            setState(() {
                              _formData['rests'][index]['start'] = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter start time',
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('End'),
                        subtitle: TextFormField(
                          initialValue: _formData['rests'][index]['end'],
                          onChanged: (value) {
                            setState(() {
                              _formData['rests'][index]['end'] = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter end time',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shower',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _formData['showers'].length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      'Shower ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text('Morning'),
                        subtitle: TextFormField(
                          initialValue: _formData['showers'][index]['morning'],
                          onChanged: (value) {
                            setState(() {
                              _formData['showers'][index]['morning'] = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'time',
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Afternoon'),
                        subtitle: TextFormField(
                          initialValue: _formData['showers'][index]
                              ['afternoon'],
                          onChanged: (value) {
                            setState(() {
                              _formData['showers'][index]['afternoon'] = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'time',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Notes for my parents',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                initialValue: _formData['notes for my parents'],
                onChanged: (value) {
                  setState(() {
                    _formData['notes for my parents'] = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _saveFormData();
                  _showDialog(
                      context); // Call the method to display the form data
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveFormData() {
    // You can add any additional save logic here
    print('Form data saved: $_formData');
    _formData['Date'] = _selectedDate;
    _formData['arrival'] = _selectedTime;
    _showDialog(context);
    var savedData;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DailyReportPage(savedData: savedData, formData: _formData),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: _formData.entries.map((entry) {
                if (entry.value is List) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${entry.key}:'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (entry.value as List).map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(item.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                } else {
                  return Text('${entry.key}: ${entry.value}');
                }
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
