import 'package:flutter/material.dart';
import 'activity_child_data.dart';

class ChildrenActivityPage extends StatefulWidget {
  const ChildrenActivityPage({Key? key}) : super(key: key);

  @override
  _ChildrenActivityPageState createState() => _ChildrenActivityPageState();
}

class _ChildrenActivityPageState extends State<ChildrenActivityPage> {
  late List<String> childrenNames;
  late String selectedChild;
  Map<String, dynamic> childData = {};

  @override
  void initState() {
    super.initState();
    childrenNames = ActivityInputPage.childrenData.keys.toList();
    if (childrenNames.isNotEmpty) {
      selectedChild = childrenNames.first;
      _loadChildData();
    }
  }

  void _loadChildData() {
    if (childrenNames.isNotEmpty) {
      setState(() {
        childData = ActivityInputPage.getChildData(selectedChild);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivitas Anak'),
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
          child: childrenNames.isEmpty
              ? const Center(
                  child: Text('Belum ada data anak.',
                      style: TextStyle(fontSize: 18)))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        isExpanded: true,
                        value: selectedChild,
                        items: childrenNames.map((String name) {
                          return DropdownMenuItem<String>(
                            value: name,
                            child: Text(name),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedChild = newValue;
                              _loadChildData();
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      if (childData.isNotEmpty) ...[
                        Text('Nama: ${childData['name']}',
                            style: const TextStyle(fontSize: 18)),
                        Text('Umur: ${childData['age']} Tahun',
                            style: const TextStyle(fontSize: 18)),
                        Text('Suhu Badan: ${childData['temperature']}°C',
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        const Text('Informasi Makan:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Pagi: ${childData['breakfast'] ?? '-'}',
                            style: const TextStyle(fontSize: 18)),
                        Text('Siang: ${childData['lunch'] ?? '-'}',
                            style: const TextStyle(fontSize: 18)),
                        Text('Sore: ${childData['snack'] ?? '-'}',
                            style: const TextStyle(fontSize: 18)),
                        Text('Malam: ${childData['dinner'] ?? '-'}',
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        const Text('Informasi Tambahan:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(childData['additionalInfo'] ?? '-',
                            style: const TextStyle(fontSize: 18)),
                      ] else
                        const Text('Tidak ada data untuk anak ini.',
                            style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}