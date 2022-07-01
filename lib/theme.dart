import 'package:flutter/material.dart';

Color priColor = Colors.blue;
Color secColor = Colors.white;

ThemeData theme() {
  return ThemeData(
    canvasColor: Colors.white,
    primaryColor: priColor,
    appBarTheme: const AppBarTheme(
      elevation: 1,
      shadowColor: Color(0xffE1E2EF),
      backgroundColor: Colors.white,
      foregroundColor: Color(0xff093824),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xff093824),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffFF9650),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffFF9650),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffFF9650),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(side: BorderSide(color: Colors.red)),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: priColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xff000080),
      // unselectedIconTheme: const IconThemeData(color: Colors.red),
    ),
    // BottomNavigationBarItem
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromRGBO(9, 56, 36, 0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffFF9650)),
        borderRadius: BorderRadius.circular(8),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusColor: Colors.white,
      hintStyle: const TextStyle(color: Color.fromRGBO(9, 56, 36, 0.2)),
    ),
  );
}
