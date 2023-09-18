import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'DM Sans',
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: colorPrimary,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Colors.black,
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 4,
          color: colorPrimary,
        ),
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
