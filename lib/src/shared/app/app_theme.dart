import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        backgroundColor: Colors.red,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        titleSpacing: 16,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }
}
