import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.amber,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
