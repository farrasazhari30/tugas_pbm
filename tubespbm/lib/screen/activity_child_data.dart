import 'package:flutter/material.dart';
import 'package:tubespbm/screen/children_activity_data.dart';

class ActivityInputPage extends StatefulWidget {
  static Map<String, dynamic> childrenData = {};

  static Map<String, dynamic> getChildData(String childName) {
    return childrenData[childName] ?? {};
  }

  const ActivityInputPage({Key? key}) : super(key: key);

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
  String napTime = ''; // New field for nap time
  String? milkAmount; // New field for milk amount
  String? milkType; // New field for milk type
  String additionalInfo = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void _saveChildData() {
    setState(() {
      ActivityInputPage.childrenData[childName] = {
        'name': childName,
        'age': childAge,
        'temperature': childTemperature,
        'hasMeal': hasMeal,
        'breakfast': breakfast,
        'lunch': lunch,
        'snack': snack,
        'dinner': dinner,
        'napTime': napTime,
        'milkAmount': milkAmount,
        'milkType': milkType,
        'additionalInfo': additionalInfo,
        'selectedDate': selectedDate,
        'selectedTime': selectedTime,
      };
    });
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
      napTime = '';
      milkAmount = null; // Reset milkAmount field
      milkType = null; // Reset milkType field
      additionalInfo = '';
      selectedDate = null;
      selectedTime = null;
      dateController.clear();
      timeController.clear();
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
              child: const Text('Lihat Data Anak'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChildrenActivityPage(),
                  ),
                );
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text = '${picked.hour}:${picked.minute}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Aktivitas Anak'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 167, 169, 170),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
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
                  const SizedBox(height: 20),
                  const Text(
                    'Pilih Tanggal dan Jam Kedatangan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            hintText: 'Tanggal',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
                          ),
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: timeController,
                          decoration: InputDecoration(
                            hintText: 'Jam',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () {
                                _selectTime(context);
                              },
                            ),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                      suffixIcon: Icon(Icons.person),
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
                    'Makan dan Minum',
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
                            suffixIcon: Icon(Icons.fastfood),
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
                            suffixIcon: Icon(Icons.fastfood),
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
                            suffixIcon: Icon(Icons.fastfood),
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
                            suffixIcon: Icon(Icons.fastfood),
                          ),
                          onChanged: (val) {
                            setState(() => dinner = val);
                          },
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  const Text(
                    'Waktu Istirahat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Waktu Istirahat',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: Icon(Icons.access_alarm),
                    ),
                    onChanged: (val) {
                      setState(() => napTime = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Minum Susu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Jumlah ML',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: Icon(Icons.local_drink),
                    ),
                    onChanged: (val) {
                      setState(() => milkAmount = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    hint: const Text('Jenis Susu'),
                    items: [
                      DropdownMenuItem(
                        value: 'Asi',
                        child: Text('Asi'),
                      ),
                      DropdownMenuItem(
                        value: 'Formula',
                        child: Text('Formula'),
                      ),
                      DropdownMenuItem(
                        value: 'Susu sapi',
                        child: Text('Susu sapi'),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() => milkType = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Jadwal Toilet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Jam',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: Icon(Icons.access_alarm),
                          ),
                          onChanged: (val) {
                            // Implement your logic to save toilet time
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          hint: const Text('Tipe'),
                          items: [
                            DropdownMenuItem(
                              value: 'Potty',
                              child: Text('Potty'),
                            ),
                            DropdownMenuItem(
                              value: 'Diaper',
                              child: Text('Diaper'),
                            ),
                          ],
                          onChanged: (val) {
                            // Implement your logic to save toilet type
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Informasi untuk Orang Tua',
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
                      suffixIcon: Icon(Icons.info_outline),
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
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Simpan',
                          style: TextStyle(color: Colors.black)),
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
