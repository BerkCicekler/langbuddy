import 'package:flutter/material.dart';
import 'package:langbuddy/product/constants/font_constants.dart';

/// Light theme class
final class CustomLightTheme {
  CustomLightTheme._();

  /// App's main light theme variable
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    colorScheme: const ColorScheme.light(
      //primary: Color(0XFF1dab62),
      onPrimary: Color(0XFF333333),
      background: Color(0XFFf5f5f5),
      surface: Color(0XFFfafafa),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    ),
    fontFamily: FontConstants.inter,
  );
}
