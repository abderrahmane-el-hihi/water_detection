import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
  primaryColorDark: Color.fromRGBO(0, 78, 131, 10),
  cardTheme: CardTheme(color: Color.fromRGBO(0, 78, 131, 10)),
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.white,
      secondary: Colors.transparent),
);
