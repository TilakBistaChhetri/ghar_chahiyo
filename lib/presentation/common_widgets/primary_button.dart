import 'package:flutter/material.dart';
import '../../core/constants/my_colors.dart';
import '../../core/constants/my_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
      width: 353,  
      height: 41, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: MyColors.white,
            fontSize: AppFontSizes.normal,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
