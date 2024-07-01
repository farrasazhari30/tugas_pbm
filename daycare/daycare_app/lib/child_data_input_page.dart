import 'package:flutter/material.dart';

class ChildDataInputPage extends StatefulWidget {
  @override
  _ChildDataInputPageState createState() => _ChildDataInputPageState();
}

class _ChildDataInputPageState extends State<ChildDataInputPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _childData = {};
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Center(
          child: Text(
            'Child Data',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField('Name', Icons.person),
              SizedBox(height: 16.0),
              _buildTextFormField('Age', Icons.cake),
              SizedBox(height: 16.0),
              _buildDatePicker(context),
              SizedBox(height: 16.0),
              _buildTimePicker(context),
              SizedBox(height: 16.0),
              _buildTextFormField('Condition', Icons.medical_services),
              SizedBox(height: 16.0),
              _buildTextFormField('Allergic', Icons.warning),
              SizedBox(height: 16.0),
              _buildTextFormField('Temperature', Icons.thermostat),
              SizedBox(height: 16.0),
              _buildTextFormField('Bottle', Icons.local_drink),
              SizedBox(height: 16.0),
              _buildTextFormField('Milk Type', Icons.local_cafe),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  if (_selectedDate != null) {
                    _childData['date'] = _selectedDate.toString();
                  }
                  if (_selectedTime != null) {
                    _childData['arrival'] = _selectedTime!.format(context);
                  }
                  Navigator.pop(context, _childData);
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[300],
                ),
              ),
              SizedBox(height: 24.0),
              _buildResultsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onSaved: (value) => _childData[label.toLowerCase()] = value!,
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            _selectedDate == null
                ? 'No date chosen!'
                : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
          ),
        ),
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != _selectedDate)
              setState(() {
                _selectedDate = pickedDate;
              });
          },
        ),
      ],
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            _selectedTime == null
                ? 'No time chosen!'
                : 'Arrival: ${_selectedTime!.format(context)}',
          ),
        ),
        IconButton(
          icon: Icon(Icons.access_time),
          onPressed: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null && pickedTime != _selectedTime)
              setState(() {
                _selectedTime = pickedTime;
              });
          },
        ),
      ],
    );
  }

  Widget _buildResultsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _childData.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text('${entry.key}: ${entry.value}'),
        );
      }).toList(),
    );
  }
}
