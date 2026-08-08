import 'package:flutter/material.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? const Color(0xFFD9632C)
        : const Color(0xFF6C5B43);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 5),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}