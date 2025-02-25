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
          const HorizontalMenu(), // ✅ Universal menu at the top
          const Divider(), // Optional divider for clarity
          Expanded(child: child), // Page content below the menu
          const FooterSection(), // ✅ Footer section at the bottom
        ],
      ),
    );
  }
}

/// ✅ **Footer Section**
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "Made by Hieu",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600, // ✅ Grey color
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterLink(text: "Terms of Use", onTap: () {}),
              const SizedBox(width: 15),
              FooterLink(text: "Privacy Policy", onTap: () {}),
              const SizedBox(width: 15),
              FooterLink(text: "Contact Us", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

/// ✅ **Clickable Footer Links (Grey Color)**
class FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FooterLink({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600, // ✅ Grey color
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
