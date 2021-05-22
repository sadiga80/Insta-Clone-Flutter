import 'package:flutter/material.dart';

var appTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.grey[50],
  appBarTheme: AppBarTheme(
    brightness: Brightness.light, //Status Bar will be black
    color: Colors.white,
    iconTheme:
        const IconThemeData(color: Colors.black //as appBar colors is white
            ),
    textTheme: TextTheme(
      headline6: TextStyle(
          //headline6 is app bar title theme
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w600),
    ),
  ),
);
