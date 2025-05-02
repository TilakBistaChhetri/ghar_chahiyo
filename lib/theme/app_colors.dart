import 'package:flutter/material.dart';

/// MagicBricks inspired color palette
class AppColors {
  // Primary colors (consistent across themes)
  static const Color primary = Color(0xFF050A30);
  static const Color primaryVariant = Color(0xFF001F5B);
  static const Color primaryDark = Color(0xFFC62828);
  static const Color primaryLight = Color(0xFFFFCDD2);

  // Secondary colors (consistent across themes)
  static const Color secondary = Color(0xFF1A73E8);
  static const Color secondaryDark = Color(0xFF0D47A1);
  static const Color secondaryLight = Color(0xFFBBDEFB);

  // Semantic colors (consistent across themes)
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  // Text colors on colored backgrounds (consistent)
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFF212121);

  // Light theme specific colors
  static const Color lightBackground = Color(0xFFF8F8F8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightTextDisabled = Color(0xFFBDBDBD);
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightDivider = Color(0xFFEEEEEE);

  // Dark theme specific colors
  static const Color darkPrimaryVariant = Color(0xFFC62828);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFEEEEEE);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
  static const Color darkTextDisabled = Color(0xFF666666);
  static const Color darkBorder = Color(0xFF333333);
  static const Color darkDivider = Color(0xFF2A2A2A);

  //Border colors (consistent across themes):
  static const Color border = Color(0xFF424242); // Dark gray border color

  static const Color surface = Color(0xFFFFFFFF); // Or your desired color

  // Derived theme-sensitive getters (to be used in widgets)
  static Color getSearchBarBgColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightSurface
        : darkSurface;
  }

  static Color getCardBgColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightSurface
        : darkSurface;
  }

  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightBorder
        : darkBorder;
  }

  static Color getTextPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightTextPrimary
        : darkTextPrimary;
  }

  static Color getTextSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightTextSecondary
        : darkTextSecondary;
  }

  static Color getShadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.black.withOpacity(0.1)
        : Colors.black.withOpacity(0.3);
  }
}
