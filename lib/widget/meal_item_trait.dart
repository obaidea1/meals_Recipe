import 'package:flutter/material.dart';

class MealItemTreait extends StatelessWidget {
  const MealItemTreait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 14),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          
        ),
      ],
    );
  }
}
