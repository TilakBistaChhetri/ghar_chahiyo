import 'package:flutter/material.dart';

class ShareIconButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const ShareIconButton({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
