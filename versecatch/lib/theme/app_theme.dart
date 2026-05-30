import 'package:flutter/material.dart';

class AppColors {
  static const deepNavy = Color(0xFF0B1F3A);
  static const gold = Color(0xFFD4AF37);
  static const darkBg = Color(0xFF121212);
  static const softWhite = Color(0xFFF5F5F5);
  static const surfaceDark = Color(0xFF1E1E1E);
  static const mutedGold = Color(0xFFB8942E);
  static const success = Color(0xFF4CAF50);
  static const error = Color(0xFFE53935);
  static const liveRed = Color(0xFFE53935);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.gold,
        secondary: AppColors.gold,
        surface: AppColors.surfaceDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.deepNavy,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.deepNavy,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.softWhite,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.softWhite,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.softWhite,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.softWhite,
        ),
      ),
    );
  }
}
