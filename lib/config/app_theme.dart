import 'package:flutter/material.dart';

class AppSizes {
  static const double initialScreenLoader = 48.0;
  static const double unreadedBubble = 20.0;
  static const double iconSize = 24.0;
  static const double cardCorner = 20.0;
  static const double cardElevation = 5.0;
  static const double smallPadding = 8.0;
  static const double mediumPadding = 14.0;
  static const double largePadding = 22.0;
  static const double cardSide = 200.0;
  static const int shimmersQuantity = 5;
}

class AppColors {
  static const darkGray = Color(0xFF261C15);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFF05D23);
  static const error = Color(0xFFD10000);
  static const lightGray = Color(0xFFF7F7F2);
  static const lightGreen = Color(0xFFE4E6C3);
  static const gray = Color(0xFFDBD7D2);
}

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      canvasColor: AppColors.lightGray,
      dividerColor: AppColors.darkGray,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkGray,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardCorner),
        ),
        elevation: AppSizes.cardElevation,
      ),
      iconTheme: const IconThemeData(color: AppColors.orange),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        labelMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
