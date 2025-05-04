import 'package:flutter/material.dart';

class IconMenuItem extends StatelessWidget {
  final String? iconPath;
  final String? label;
  final VoidCallback? onTap;

  const IconMenuItem({
    this.iconPath,
    this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF6F7FB),
              ),
              child: iconPath != null
                  ? Image.asset(
                      iconPath!,
                      height: 40,
                      width: 40,
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 6),
            Text(
              label ?? '',
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
