
// Centralising colours and text styles prevents inconsistency.
// If the brand colour needs to change, you update it in one place only.

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // Private constructor — this class should never be instantiated

  static const Color primaryOrange = Color(0xFFF68B1E); 
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color subtleGrey = Color(0xFF888888);
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color successGreen = Color(0xFF27AE60);
  static const Color dividerColor = Color(0xFFE0E0E0);

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryOrange,
        primary: primaryOrange,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryOrange,
        foregroundColor: white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      scaffoldBackgroundColor: lightBackground,
      useMaterial3: true,
    );
  }
}