import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          CircleAvatar(child: Icon(icon)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}