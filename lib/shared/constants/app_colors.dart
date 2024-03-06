import 'package:flutter/material.dart';

class AppColors {
  static const ColorScheme colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: white,
    secondary: secondary,
    onSecondary: white,
    error: error,
    onError: black,
    background: background,
    onBackground: primary,
    surface: background,
    onSurface: primaryText,
  );
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color primary = Color(0xFF303C4B);
  static const Color secondary = Color(0xFF3A435E);
  static const Color primaryText = Color(0xFF080A0C);
  static const Color background = white;
  static const Color error = Color(0xFFB00020);
  static const Color hover = Color(0xFFC0C6D8);
  static const Color border = Color(0xFFE1E3E5);
  static const Color textLight = Color(0xFF787774);
}
