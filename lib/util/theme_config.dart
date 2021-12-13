import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  //Colors for theme
  static Color lightCyan = Colors.cyanAccent;
  static Color lightPrimary =  Colors.cyan;
  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightAccent = Colors.white;
  static Color darkAccent = Colors.white;
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = const Color(0xff121212);
  static Color badgeColor = Colors.red;

  static TextTheme lightTextTheme = TextTheme(

  bodyText1: const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  fontFamily: 'Ubuntu',
  color: Colors.black54
  ),

  headline1: const TextStyle(
    fontFamily: 'HelveticaNeue',
    fontSize: 21,
    fontWeight: FontWeight.bold

  ),

  headline2:  const TextStyle(
      fontFamily: 'HelveticaNeue',
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Colors.black54

  ),

  headline3: const TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 16,
      fontWeight: FontWeight.w500,
     color: Colors.black87

  ),
  headline6: GoogleFonts.openSans(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  );


  ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    indicatorColor:lightPrimary,
    primarySwatch:  Colors.cyan,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
