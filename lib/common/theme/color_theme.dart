import 'package:flutter/material.dart';

class ColorTheme {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    // colorScheme: const ColorScheme.light(),
  );
}
