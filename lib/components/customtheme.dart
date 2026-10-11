import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      labelLarge: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
  );
}
