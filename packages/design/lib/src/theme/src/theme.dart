import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'const.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  cardTheme: kCardTheme,
  fontFamily: 'almarai',
  inputDecorationTheme: _kInputDecoration(
    AppColors.textFieldFill,
    AppColors.textFieldBorder,
  ),
  colorSchemeSeed: AppColors.primaryColor,
);
final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  cardTheme: kCardTheme,
  colorSchemeSeed: AppColors.primaryColor,
  inputDecorationTheme: _kInputDecoration(
    AppColors.textFieldFillDark,
    AppColors.textFieldBorderDark,
  ),
  fontFamily: 'almarai',
);

const kCardTheme = CardTheme(
  shadowColor: Colors.transparent,
  clipBehavior: Clip.antiAlias,
);
const _borderWidth = 1.0;
final _inputBorderRadius = BorderRadius.circular(RadiusConstrains.texFiled);

_kInputDecoration(
  Color fillColor,
  Color borderColor,
) =>
    InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsetsConstrains.textFiled,
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: _borderWidth,
          color: borderColor,
        ),
        borderRadius: _inputBorderRadius,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: _borderWidth,
          color: borderColor,
        ),
        borderRadius: _inputBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: _borderWidth,
          color: borderColor,
        ),
        borderRadius: _inputBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: _borderWidth,
          color: borderColor,
        ),
        borderRadius: _inputBorderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: _borderWidth,
          color: borderColor,
        ),
        borderRadius: _inputBorderRadius,
      ),
    );
