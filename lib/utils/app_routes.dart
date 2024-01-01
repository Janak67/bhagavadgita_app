import 'package:bhagavadgita_app/screen/details/view/details_screen.dart';
import 'package:bhagavadgita_app/screen/home/view/home_screen.dart';
import 'package:bhagavadgita_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'detail': (context) => const DetailsScreen(),
};
