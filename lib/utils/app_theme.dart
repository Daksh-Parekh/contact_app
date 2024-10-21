import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData(
    colorSchemeSeed: Colors.cyan,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.cyan,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      displayLarge: TextStyle(fontSize: 18),
      displayMedium: TextStyle(fontSize: 15, color: Colors.grey),
      displaySmall: TextStyle(fontSize: 10),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
          iconSize: WidgetStatePropertyAll(30),
          iconColor: WidgetStatePropertyAll(Colors.black)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.cyan)),
    ),
  );
}
// ThemeData(
//           colorSchemeSeed: Colors.teal,
//           appBarTheme: AppBarTheme(
//             centerTitle: true,
//             backgroundColor: Colors.cyan,
//           ),
//           textTheme: TextTheme(
//             titleLarge: TextStyle(),
//             labelMedium: TextStyle(),
//             headlineLarge: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//             headlineMedium: TextStyle(
//               fontSize: 20,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ),