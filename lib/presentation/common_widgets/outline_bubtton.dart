import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,

    this.title,
    this.onPressed,
  });

  final String ? title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
          minimumSize: Size(60.w, 40.h), 
        shape: RoundedRectangleBorder(
          side: BorderSide(color:Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
            title ?? '',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
