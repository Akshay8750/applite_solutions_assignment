import 'package:flutter/material.dart';

class AppColorScheme {
  static const ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF15141F),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFFF8F71),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFFBBBBBB),
      scrim: Color(0xFFBCBCBC),
      outline: Color(0xFFFAF0CA),
      onSurface: Color(0xFFFFFFFF));

  static const ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFFFFF),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFFBBBBBB),
      scrim: Color(0xFFBCBCBC),
      onSurface: Color(0xFFFFFFFF));
}
