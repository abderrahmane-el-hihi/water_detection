import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      button: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
  );
}
