import 'package:flutter/material.dart';
import 'login.dart';
import 'registration_page.dart';
import 'parent_home.dart';
import 'nanny_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Child Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/parent_home': (context) => ParentHome(),
        '/nanny_home': (context) => NannyHome(),
      },
    );
  }
}