import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  /// Constructs a [LoginScreen]
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: Container(width: 200, height: 200, color: Colors.orange),
      ),
    );
  }
}
