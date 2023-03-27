import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    // Title
    titleLarge: TextStyle().copyWith(
      fontFamily: "Outfit",
      color: Color(0xffb1b2ff),
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.grey,
      fontSize: 16,
    ),
    titleSmall: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    // Label
    labelMedium: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.black,
      fontSize: 20,
    ),
    labelSmall: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.black,
      fontSize: 20,
    ),

    // Body
    bodyLarge: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.white,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.white,
      fontSize: 20,
    ),
    bodySmall: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.black,
      fontSize: 18,
    ),

    // Display
    displayMedium: TextStyle(
      fontFamily: "Outfit",
      fontSize: 23,
      letterSpacing: 1.2,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle().copyWith(
      fontFamily: "Comfortaa",
      color: Colors.grey,
      fontSize: 16,
    ),

    // Headline
    headlineMedium: TextStyle(
      fontFamily: "Outfit",
      height: 1.2,
      letterSpacing: 1.2,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}
