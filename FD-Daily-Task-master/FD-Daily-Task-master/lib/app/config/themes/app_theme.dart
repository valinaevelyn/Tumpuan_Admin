import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        fontFamily: Font.nunito,
        canvasColor: Colors.white,
        primarySwatch: const MaterialColor(
          0xFFFB6F92,
          <int, Color>{
            50: Color(0xFFFB6F92),
            100: Color(0xFFFB6F92),
            200: Color(0xFFFB6F92),
            300: Color(0xFFFB6F92),
            400: Color(0xFFFB6F92),
            500: Color(0xFFFB6F92),
            600: Color(0xFFFB6F92),
            700: Color(0xFFFB6F92),
            800: Color(0xFFFB6F92),
            900: Color(0xFFFB6F92),
          },
        ),
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.

  // example :
  // static ThemeData get light => ThemeData();
  // static ThemeData get dark => ThemeData();
}
