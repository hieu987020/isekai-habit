import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalMenu extends StatelessWidget {
  const HorizontalMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuItem(
            icon: Icons.list_alt,
            label: "My Habit",
            onPressed: () => context.go('/'),
          ),
          const SizedBox(width: 20),
          MenuItem(
            icon: Icons.person,
            label: "Profile",
            onPressed: () => context.go('/profile'),
          ),
          const SizedBox(width: 20),
          MenuItem(
            icon: Icons.settings,
            label: "Setting",
            onPressed: () => context.go('/setting'),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
