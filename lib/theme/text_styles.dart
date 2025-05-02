import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized text styles
class AppTextStyles {
  // Font family
  static const String fontFamily = 'Roboto';

  // Font sizes
  static const double fontSizeXXXS = 8.0;
  static const double fontSizeXXS = 10.0;
  static const double fontSizeXS = 12.0;
  static const double fontSizeS = 14.0;
  static const double fontSizeM = 16.0;
  static const double fontSizeL = 18.0;
  static const double fontSizeXL = 20.0;
  static const double fontSizeXXL = 24.0;
  static const double fontSizeDisplay = 34.0;

  // Heading styles
  static TextStyle get h1 => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeDisplay,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get h2 => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get h3 => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXL,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnSecondary,
  );

  // Body text styles
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeL,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeM,
    color: AppColors.textOnPrimary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeS,
    color: AppColors.textOnSecondary,
  );

  // Button text styles
  static TextStyle get button => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeM,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: AppColors.textOnPrimary,
  );

  // Caption and overline
  static TextStyle get caption => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    color: AppColors.textOnSecondary,
  );

  static TextStyle get smallcaption => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXXS,
    color: AppColors.textOnSecondary,
  );
}
