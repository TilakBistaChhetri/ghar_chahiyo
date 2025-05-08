// import 'package:flutter/material.dart';
// import '../../../../../core/constants/my_colors.dart';
// import '../../../../../core/constants/my_fonts.dart';

// class SidebarMenuItem extends StatelessWidget {
//   final String? title;
//   final Widget? destination;
//   final Color? textColor;
//   final VoidCallback? onTap;

//   const SidebarMenuItem(String title, {
//     super.key,
//     this.title,
//     this.destination,
//     this.textColor,
//     this.onTap, 
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         title ?? 'No Title',
//         style: TextStyle(
//           fontSize: AppFontSizes.normal,
//           color: textColor ?? MyColors.primaryColor,
//         ),
//       ),
//       onTap: () {
//         if (onTap != null) {
//           onTap!();
//         } else if (destination != null) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => destination!),
//           );
//         }
//       },
//     );
//   }
// }





import 'package:flutter/material.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/constants/my_fonts.dart';

class SidebarMenuItem extends StatelessWidget {
  final String title;  
  final Widget? destination;
  final Color? textColor;
  final VoidCallback? onTap;

  const SidebarMenuItem({
    super.key,
    required this.title, 
    this.destination,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppFontSizes.normal,
          color: textColor ?? MyColors.primaryColor,
        ),
      ),
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination!),
          );
        }
      },
    );
  }
}
