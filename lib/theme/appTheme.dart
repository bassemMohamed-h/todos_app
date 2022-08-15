import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static Color lightPrimaryColor = const Color(0xff5D9CEC);
  static Color darkPrimaryColor = const Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontSize: 18,
        color: lightPrimaryColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: 'Arial',
        fontSize: 14,
        color: lightPrimaryColor,

    ),
      displaySmall: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto',
          fontSize: 12,
          color: lightPrimaryColor,
        )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimaryColor,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontSize: 22,
        color: Colors.white,
      )
    ),
    scaffoldBackgroundColor: Color(0xffDFECDB),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: lightPrimaryColor,

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightPrimaryColor,
      elevation: 4,
    )
  );


}