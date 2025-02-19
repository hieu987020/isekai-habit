import 'package:flutter/material.dart';
import 'package:isekai_habit/presentation/widgets/horizontal_menu.dart';

/// Universal layout with persistent horizontal menu
class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HorizontalMenu(), // Universal menu at the top
          const Divider(), // Optional divider for clarity
          Expanded(child: child), // Page content below the menu
        ],
      ),
    );
  }
}
