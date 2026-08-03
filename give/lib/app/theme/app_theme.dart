import 'package:flutter/material.dart';
import 'package:give/app/app.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primarySeed,
        brightness: Brightness.light,
        onPrimary: AppColors.donationAccent,
        error: AppColors.error,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.donationAccent,
        brightness: Brightness.dark,
      ),
    );
  }
}
