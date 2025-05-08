import 'package:flutter/material.dart';

import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/constants/my_fonts.dart';

class ContactButton extends StatelessWidget {
  final String? title;
  final String? url;
  final String? assetPath;

  const ContactButton({super.key, this.title, this.url, this.assetPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors.secondaryColor),
        ),
        child: Row(
          children: [
            assetPath != null
                ? Image.asset(assetPath!, height: 24, width: 24)
                : const SizedBox(width: 24, height: 24),
            const SizedBox(width: 12),
            Text(title ?? 'No Title', style: const TextStyle(fontSize:AppFontSizes.normal, color:MyColors.black, fontWeight:FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
