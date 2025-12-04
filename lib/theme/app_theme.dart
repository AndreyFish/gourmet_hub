import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF9B59B6), // фиолетовый
    scaffoldBackgroundColor: const Color(0xFFFFF1F7), // нежно-розовый фон
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFF1F7),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF9B59B6)),
      titleTextStyle: TextStyle(
        color: Color(0xFF9B59B6),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFF1F7),
      selectedItemColor: Color(0xFF9B59B6),
      unselectedItemColor: Color(0xFFB18CCC),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    iconTheme: const IconThemeData(
      color: Color(0xFF9B59B6),
    ),
  );
}
