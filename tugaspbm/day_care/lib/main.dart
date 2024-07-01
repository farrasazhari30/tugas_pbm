import 'package:flutter/material.dart';
import 'login_page.dart';
import 'parents_page.dart';
import 'dailyreport_page.dart';
import 'nanny_page.dart';
import 'registration_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Report',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      routes: {
        '/parent': (context) => ParentPage(),
        '/daily-report': (context) => DailyReportPage(
              savedData: ModalRoute.of(context)!.settings.arguments
                  as List<Map<String, dynamic>>,
              formData: {},
            ),
        '/nanny': (context) => NannyPage(),
        '/registration': (context) => RegistrationPage(),
      },
    );
  }
}
