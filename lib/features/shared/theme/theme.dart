import 'package:flutter/material.dart';

class AppTheme {
  // Light theme data
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4CAF50), // Green
    hintColor: const Color(0xFFFF9800), // Orange
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF333333), fontSize: 16), // Dark Gray
      displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      displayMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      displaySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF4CAF50), // Ensure this has enough contrast
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );

  // Dark theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF4CAF50), // Green
    hintColor: const Color(0xFFFF9800), // Orange
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16), // White text
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF4CAF50), // Ensure this has enough contrast
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );

  // Method to get the appropriate theme based on the ThemeMode
  static ThemeData getTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.system:
        return lightTheme;
    }
  }
}
