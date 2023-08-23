import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Theme fontBuilder(BuildContext context, Widget child) {
  final languageCode = Localizations.localeOf(context).languageCode;
  final themeData = Theme.of(context);
  final enFamily = GoogleFonts.notoSansTextTheme(

  );
  final arFamily = GoogleFonts.notoKufiArabicTextTheme();
  final textTheme = languageCode == 'en' ? enFamily : arFamily;
  return Theme(
    data: themeData.copyWith(
      textTheme: textTheme,
    ),
    child: child,
  );
}
