import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBackground = Color(0xffF5F5F5);
  static const Color textFieldFill = Color(0xffFAFAFA);
  static const Color textFieldFillDark = Color(0xff3c3e3e);
  static const Color textFieldBorder = Color(0xffEAEAEA);
  static const Color textFieldBorderDark = Color(0xff3c3e3e);
  static const Color lightGrey = Color(0xffE1E2E4);

  static const int _primary = 0xFF253A5A;

  static Color get primaryColor => const Color(_primary);

  static const MaterialColor primarySwatch = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFD3D7F2),
      100: Color(0xFF7B87D9),
      200: Color(0xFF4E5FCC),
      300: Color(0xFF3343AF),
      400: Color(0xFF263284),
      500: Color(_primary),
      600: Color(0xFF192157),
      700: Color(0xFF131941),
      800: Color(0xFF0D112B),
      900: Color(0xFF060816),
    },
  );

  static const int _secondary = 0xFFFFBF40;

  static const MaterialColor secondarySwatch = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFFFF5E0),
      100: Color(0xFFFFE0A1),
      200: Color(0xFFFFD581),
      300: Color(0xFFFFCB62),
      400: Color(_secondary),
      500: Color(0xFFFFAE0D),
      600: Color(0xFFD68F00),
      700: Color(0xFFA16B00),
      800: Color(0xFF6B4700),
      900: Color(0xFF362400),
    },
  );

  static const int _error = 0xFFBB121A;

  static const MaterialColor errorSwatch = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFFAD1D3),
      100: Color(0xFFF1747A),
      200: Color(0xFFED454E),
      300: Color(0xFFE81721),
      400: Color(_error),
      500: Color(0xFF9B0F16),
      600: Color(0xFF7C0C12),
      700: Color(0xFF5D090D),
      800: Color(0xFF3E0609),
      900: Color(0xFF1F0304),
    },
  );
}
