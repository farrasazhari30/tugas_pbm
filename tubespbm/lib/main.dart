import 'package:flutter/material.dart';
import 'package:tubespbm/screen/activity_child_data.dart';
import 'package:tubespbm/screen/register_page.dart';
import 'package:tubespbm/screen/login_page.dart';
import 'package:tubespbm/screen/children_activity_data.dart';
import 'package:tubespbm/screen/login_section.dart';
import 'item_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAYCARE',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginSelectionPage(),
        '/register': (context) => const RegistrasiPage(),
        '/login': (context) => const LoginPage(),
        '/home_caregiver': (context) => const ActivityInputPage(),
        '/home_parent': (context) => const ChildrenActivityPage(),
        '/item_list': (context) => ItemList(),
      },
    );
  }
}
