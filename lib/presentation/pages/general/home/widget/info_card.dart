import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String iconPath;
  final String value;
  final String unit;
  final Color borderColor;

  const InfoCard({
    super.key,
    required this.iconPath,
    required this.value,
    required this.unit,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 24, width: 24),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value, style: const TextStyle(fontSize: 12)),
              Text(unit, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
