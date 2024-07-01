import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  String role = 'Parent';
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Center(
          child: Text('DAYCARE CENTER', 
          style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Container(
        color: Colors.white, 
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              SizedBox(height: 20),

              Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), 

              SizedBox(height: 20), 

               Image.asset(
                'images/baby.png', // Path to your image asset
                height: 300, // Set the height of the image
              ),

              SizedBox(height: 20), 

              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.grey[200], // Ganti warna latar belakang input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20), // Tambahkan jarak antara input fields
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200], 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20), 
              DropdownButton<String>(
                value: role,
                onChanged: (String? newValue) {
                  setState(() {
                    role = newValue!;
                  });
                },
                items: <String>['Parent', 'Nanny']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20), // Tambahkan jarak antara dropdown dan tombol login
              ElevatedButton(
                onPressed: () {
                  if (role == 'Parent') {
                    Navigator.pushReplacementNamed(context, '/parent_home');
                  } else {
                    Navigator.pushReplacementNamed(context, '/nanny_home');
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black), // Ganti warna teks tombol
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400], // Ganti warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Tambahkan jarak antara tombol login dan tombol register
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.blue), // Ganti warna teks tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}