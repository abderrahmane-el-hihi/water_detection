import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  bottomAppBarTheme: const BottomAppBarThemeData(),
  primaryColorDark: const Color(0xFF00BCD4),
  cardTheme: const CardThemeData(color: Colors.white, elevation: 4.0),
  colorScheme: const ColorScheme.light(
      surface: Colors.white,
      primary: Colors.white,
      secondary: Colors.transparent),
);
