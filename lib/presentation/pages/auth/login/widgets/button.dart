import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String imagePath;

  const GoogleButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: const BorderSide(color: Color(0xff898A8D)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, height: 24, width: 24),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
