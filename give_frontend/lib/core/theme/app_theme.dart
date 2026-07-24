import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFCF8),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF176B5B),
      primary: const Color(0xFF176B5B),
      secondary: const Color(0xFFF5A623),
    )
  );
}
