import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
  primaryColorDark: Color.fromRGBO(0, 78, 131, 10),
  cardTheme: CardTheme(color: Color.fromRGBO(0, 78, 131, 10)),
  colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.white,
      //secondary: Color.fromRGBO(0, 78, 131, 10),
      secondary: Colors.transparent),
);
