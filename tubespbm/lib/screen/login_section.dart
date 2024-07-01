import 'package:flutter/material.dart';

class LoginSelectionPage extends StatelessWidget {
  const LoginSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200], // Background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/baby.png",
                  height: 200,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'DAYCARE',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40.0),
                _buildElevatedButton(context, 'Pengasuh'),
                const SizedBox(height: 20.0),
                _buildElevatedButton(context, 'Orang tua'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String userType) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                userType,
                style: const TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login', arguments: userType);
              },
            ),
          ),
        );
      },
    );
  }
}
