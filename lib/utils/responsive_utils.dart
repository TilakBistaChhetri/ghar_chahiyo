import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }

  static bool isMediumScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 360 && width < 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  static double getFontSize(
    BuildContext context, {
    required double small,
    required double medium,
    double? large,
  }) {
    if (isSmallScreen(context)) return small;
    if (isLargeScreen(context)) return large ?? medium;
    return medium;
  }

  static double getSpacing(
    BuildContext context, {
    required double small,
    required double medium,
    double? large,
  }) {
    if (isSmallScreen(context)) return small;
    if (isLargeScreen(context)) return large ?? medium;
    return medium;
  }

  // Get padding based on screen size
  static EdgeInsets getPadding(
    BuildContext context, {
    required EdgeInsets small,
    required EdgeInsets medium,
    EdgeInsets? large,
  }) {
    if (isSmallScreen(context)) return small;
    if (isLargeScreen(context)) return large ?? medium;
    return medium;
  }
}
