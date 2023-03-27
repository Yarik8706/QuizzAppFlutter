import 'package:flutter/material.dart';
import 'package:flutter_quizzapp/themes/text_themes.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
    textTheme: AppTextTheme.lightTextTheme,
  );
}
