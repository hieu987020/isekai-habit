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
            label: "Login",
            onPressed: () => context.go('/login'),
          ),
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

class MenuItem extends StatefulWidget {
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
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color:
                _isPressed
                    ? Colors
                        .grey
                        .shade300 // Click effect
                    : _isHovered
                    ? Colors
                        .grey
                        .shade100 // Hover effect
                    : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow:
                _isHovered
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ]
                    : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 24,
                color: _isHovered ? Colors.blue.shade700 : Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 16,
                  color:
                      _isHovered ? Colors.blue.shade700 : Colors.grey.shade600,
                  fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
