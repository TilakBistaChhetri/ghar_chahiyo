import 'package:flutter/material.dart';


import '../../core/constants/my_colors.dart';



class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,

    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:MyColors.primaryColor,
     

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color:MyColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
    
        ),
      ),
    );
  }
}
