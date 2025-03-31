import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  /// Constructs a [SettingScreen]
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Screen')),
      body: Center(
        child: Container(width: 200, height: 200, color: Colors.blue),
      ),
    );
  }
}
