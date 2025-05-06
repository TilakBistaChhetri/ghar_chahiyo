import 'package:flutter/material.dart';

import '../../../../../core/constants/my_colors.dart';

class SidebarMenuItem extends StatelessWidget {
  final String? title;
  final Widget? destination;

  const SidebarMenuItem({
    super.key,
    this.title,
    this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? 'No Title', style:TextStyle(fontSize:16, color:MyColors.primaryColor)), // Use 'No Title' if title is null
      onTap: () {
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination!),
          );
        }
      },
    );
  }
}
