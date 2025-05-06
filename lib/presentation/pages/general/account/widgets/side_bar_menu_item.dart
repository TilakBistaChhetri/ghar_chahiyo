import 'package:flutter/material.dart';

class SidebarMenuItem extends StatelessWidget {
  final String title;
  final Widget destination;

  const SidebarMenuItem({
    super.key,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
    );
  }
}
