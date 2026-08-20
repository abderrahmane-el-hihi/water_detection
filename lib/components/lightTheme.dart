import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  bottomAppBarTheme: BottomAppBarThemeData(),
  primaryColorDark: Color(0xFF00BCD4),
  cardTheme: CardThemeData(color: Colors.white, elevation: 4.0),
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.white,
      secondary: Colors.transparent),
);
