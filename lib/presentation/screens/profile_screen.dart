import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  /// Constructs a [ProfileScreen]
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Container(width: 200, height: 200, color: Colors.blue),
      ),
    );
  }
}
