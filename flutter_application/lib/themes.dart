import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: Color(0xFF151A20),
    textTheme: lightTextTheme,
    fontFamily: 'Lato');

TextTheme lightTextTheme = TextTheme(
  headline1: TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
  headline3: TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ),
  bodyText1: TextStyle(
    color: Colors.white,
    fontSize: 17,
  ),
  bodyText2: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
);
