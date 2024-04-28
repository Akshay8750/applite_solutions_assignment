import 'package:flutter/material.dart';

import 'color_scheme.dart';

class AppTheme {
  ///light theme for the app
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFF15141F),
      colorScheme: AppColorScheme.lightColorScheme);

  ///dark theme for the app
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF15141F),
      primaryColor: Colors.white,
      colorScheme: AppColorScheme.darkColorScheme);
}
