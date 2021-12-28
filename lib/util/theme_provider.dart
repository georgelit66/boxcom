import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeNotifier extends ChangeNotifier {

  static Color lightCyan = const Color(0xff00ffff);
  static Color lightPrimary = const Color(0xff108080);
  static Color darkPrimary = const Color(0xff00ffff);
  static Color lightAccent =const Color(0xffffffff);
  static Color darkAccent =const Color(0xffffffff);
  static Color lightBG =  const Color(0xfffcfcff);
  static Color darkBG = const Color(0xff555555);
  static Color darkIcon = const Color(0xff858585);



  final String key = "theme";
  SharedPreferences? _prefs;
  bool? _darkTheme;

  bool get darkTheme => _darkTheme!;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme!;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs()async {
    await _initPrefs();
    _prefs!.setBool(key, _darkTheme!);
  }


  ThemeData light = ThemeData(
    backgroundColor: lightBG,
    indicatorColor:darkIcon,
    primarySwatch:  Colors.cyan,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: lightTextTheme
    ),
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    indicatorColor: darkIcon,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: darkTextTheme
    ),
  );



  static TextTheme lightTextTheme = const TextTheme(

    bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Ubuntu',
        color: Colors.black54
    ),

    headline1: TextStyle(
        fontFamily: 'HelveticaNeue',
        fontSize: 21,
        fontWeight: FontWeight.bold

    ),

    headline2:  TextStyle(
        fontFamily: 'HelveticaNeue',
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Colors.black54

    ),

    headline3: TextStyle(
        fontFamily: 'RobotoMono',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87

    ),
    headline6: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.white),
    headline1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    headline2: TextStyle(
        fontSize: 21.0,
        fontWeight: FontWeight.w700,
        color: Colors.white),
    headline3: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    headline6: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

}