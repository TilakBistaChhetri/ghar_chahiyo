import 'package:flutter/material.dart';
import '../../core/constants/my_colors.dart';
import '../../core/constants/my_fonts.dart';

class SubOutlineButton extends StatelessWidget {
  const SubOutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 48.0,
  });

  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: MyColors.primaryColor,
            fontSize: AppFontSizes.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
