import 'package:flutter/material.dart';

class ActivityInputPage extends StatefulWidget {
  static Map<String, dynamic> childrenData = {};

  static Map<String, dynamic> getChildData(String childName) {
    return childrenData[childName] ?? {};
  }

  const ActivityInputPage({super.key});

  @override
  _ActivityInputPageState createState() => _ActivityInputPageState();
}

class _ActivityInputPageState extends State<ActivityInputPage> {
  final _formKey = GlobalKey<FormState>();
  String childName = '';
  int? childAge;
  double? childTemperature;
  bool hasMeal = false;
  String? breakfast;
  String? lunch;
  String? snack;
  String? dinner;
  String additionalInfo = '';

  void _saveChildData() {
    ActivityInputPage.childrenData[childName] = {
      'name': childName,
      'age': childAge,
      'temperature': childTemperature,
      'hasMeal': hasMeal,
      'breakfast': breakfast,
      'lunch': lunch,
      'snack': snack,
      'dinner': dinner,
      'additionalInfo': additionalInfo,
    };
    _showOptionsDialog();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      childName = '';
      childAge = null;
      childTemperature = null;
      hasMeal = false;
      breakfast = null;
      lunch = null;
      snack = null;
      dinner = null;
      additionalInfo = '';
    });
  }

  void _showOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data Berhasil Disimpan'),
          content: const Text('Apa yang ingin Anda lakukan selanjutnya?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Lanjutkan Mengisi Data Anak Baru'),
              onPressed: () {
                Navigator.of(context).pop();
                _resetForm();
              },
            ),
            TextButton(
              child: const Text('Keluar'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input aktivitas Anak'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 167, 169, 170),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_activity_input.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Informasi Anak',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nama Anak',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Masukkan Nama Anak' : null,
                    onChanged: (val) {
                      setState(() => childName = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    hint: const Text('Umur Anak'),
                    items: List.generate(
                      20,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text('${index + 1} Tahun'),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => childAge = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<double>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    hint: const Text('Suhu Badan (°C)'),
                    items: List.generate(
                      12,
                      (index) => DropdownMenuItem(
                        value: 28.0 + index,
                        child: Text('${28.0 + index}°C'),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => childTemperature = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Informasi Makan dan Minum',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Belum Makan'),
                          leading: Radio<bool>(
                            value: false,
                            groupValue: hasMeal,
                            onChanged: (value) {
                              setState(() {
                                hasMeal = value!;
                                breakfast = null;
                                lunch = null;
                                snack = null;
                                dinner = null;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Sudah Makan'),
                          leading: Radio<bool>(
                            value: true,
                            groupValue: hasMeal,
                            onChanged: (value) {
                              setState(() {
                                hasMeal = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (hasMeal)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Detail Makan dan Minum',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Pagi',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() => breakfast = val);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Siang',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() => lunch = val);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Sore',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() => snack = val);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Malam',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() => dinner = val);
                          },
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  const Text(
                    'Informasi Aktivitas Tambahan untuk Orang Tua',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Informasi Aktivitas Tambahan',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => additionalInfo = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveChildData();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Aktivitas Anak Berhasil Disimpan"),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}