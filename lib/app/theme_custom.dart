import 'package:flutter/material.dart';
import 'package:movie_app/app/setting_app.dart';

class ThemeCustom {
  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: TextTheme(
        headlineLarge: SettingApp.heding1,
        headlineMedium: SettingApp.heding2,
        headlineSmall: SettingApp.heding3,
        bodyLarge: SettingApp.heding4,
      ),
    );
  }
}
