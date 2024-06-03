import 'package:flutter/material.dart';
import 'c_activity.dart';
import 'parent_act_analysis.dart';
import 'registrasi_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAILY REPORT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(navigatorKey),
        '/login': (context) => LoginPage(navigatorKey),
        '/register': (context) => RegistrationPage(navigatorKey),
        '/caregiver_activity': (context) => CaregiverActivityPage(
              navigatorKey,
              userEmail: '',
              childInfo: {},
              childGender: '',
            ),
        '/parent_activity_analysis': (context) => ParentActivityAnalysisPage(
              mealsList: [],
              toiletList: [],
              bottleList: [],
              othersList: [],
              notesForParents: '',
              activity: '',
              childName: '',
              childAge: '',
              childGender: '',
              childDate: '',
              childCondition: '',
            ),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  WelcomePage(this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blue[50], // Menambahkan warna latar belakang biru muda
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue, // Warna biru untuk AppBar
        title: Text('Welcome'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks pembuka
            Text(
              'DAILY REPORT!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20.0), // Spacer
            // Gambar untuk memperindah halaman
            Expanded(
              child: Center(
                child: Image.asset(
                  'images/baby.png',
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20.0), // Spacer
            // Tombol untuk login
            ElevatedButton(
              onPressed: () {
                // Navigasikan pengguna ke halaman login
                navigatorKey.currentState!.pushReplacementNamed('/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
