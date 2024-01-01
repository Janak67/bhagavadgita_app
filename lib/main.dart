import 'package:bhagavadgita_app/screen/details/provider/details_provider.dart';
import 'package:bhagavadgita_app/screen/home/provider/home_provider.dart';
import 'package:bhagavadgita_app/utils/app_routes.dart';
import 'package:bhagavadgita_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsProvider(),
        ),
      ],
      child: Consumer<DetailsProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.isLight ? lightTheme : darkTheme,
            routes: screen_routes,
          );
        },
      ),
    ),
  );
}
