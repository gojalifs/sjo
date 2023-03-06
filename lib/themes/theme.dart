import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color.fromRGBO(237, 237, 237, 1),
      primary: const Color.fromRGBO(255, 87, 87, 1),
      secondary: const Color.fromRGBO(189, 64, 64, 1),
      tertiary: const Color.fromRGBO(242, 155, 155, 1),
      primaryContainer: const Color.fromRGBO(232, 232, 232, 1),
    ),
    fontFamily: 'poppins',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.shifting,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: Colors.grey,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
      ),
      bodySmall: TextStyle(fontSize: 20),
      displayMedium: TextStyle(fontSize: 20),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      border: OutlineInputBorder(),
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(242, 155, 155, 1),
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        color: const Color.fromRGBO(255, 87, 87, 1),
      ),
      unselectedLabelColor: Colors.black,
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(237, 237, 237, 1),
  );
}
