import 'package:flutter/material.dart';

const List<MaterialColor> colors = [
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.grey,
  Colors.green
];

class Constants {
  static List<String>? notes = [
    "Slide To Right For More",
  ];
  static int colorInd = 0;
  ThemeData themData(int coInd) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: colors[colorInd],
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 24.0, color: Colors.black),
        toolbarTextStyle: TextStyle(fontSize: 24.0, color: Colors.black),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(
            fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black),
        headline4: TextStyle(
            fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.black),
        headline5: TextStyle(
            fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),
        bodyText2: TextStyle(fontSize: 20.0, color: Colors.white),
        bodyText1: TextStyle(fontSize: 24.0, color: Colors.black),
        button: TextStyle(fontSize: 24.0, color: Colors.black),
      ),
    );
  }
}
