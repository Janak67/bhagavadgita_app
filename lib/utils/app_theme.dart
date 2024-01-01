import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(unselectedItemColor: Colors.black),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.white12,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 19, color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(unselectedItemColor: Colors.white),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 19, color: Colors.white),
  ),
);
