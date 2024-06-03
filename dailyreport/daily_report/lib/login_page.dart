import 'package:flutter/material.dart';
import 'c_activity.dart';
import 'input_childinfo.dart';

class LoginPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  LoginPage(this.navigatorKey);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Map<String, String> parentUsers = {
    'parent1@gmail.com': 'password123',
    'p': 'p',
  };

  final Map<String, String> nannyUsers = {
    'n': 'n',
    'nanny2@gmail.com': 'password101',
  };

  bool _isLoggedIn = false;

  String _selectedUserType = 'parent'; // Default login type

  void _login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Map<String, String> selectedUsers =
        _selectedUserType == 'parent' ? parentUsers : nannyUsers;

    if (selectedUsers.containsKey(email) && selectedUsers[email] == password) {
      setState(() {
        _isLoggedIn = true;
      });

      // Navigate to the appropriate page based on user type
      if (_selectedUserType == 'parent') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InputChildInformation(widget.navigatorKey),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CaregiverActivityPage(
              widget.navigatorKey,
              userEmail: email,
              childInfo: {}, childGender: '',
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!_isLoggedIn) ...[
                    DropdownButtonFormField<String>(
                      value: _selectedUserType,
                      items: [
                        DropdownMenuItem(
                          child: Text('Parent'),
                          value: 'parent',
                        ),
                        DropdownMenuItem(
                          child: Text('Nanny'),
                          value: 'nanny',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedUserType = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        textStyle: TextStyle(fontSize: 14),
                      ),
                      child: Text('Login'),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        widget.navigatorKey.currentState!
                            .pushReplacementNamed('/register');
                      },
                      child: Text(
                        'Don\'t have an account? Register here',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
