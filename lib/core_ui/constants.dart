import 'package:flutter/material.dart';

const String appName = 'Fleeque';

class AppColors {
  static const primaryColor = Colors.white;
  static const textPrimaryColor = Colors.black;
  static final initialPageColor =
      ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken);
  static const linkColor = Color(0xFFDE412B);
}

class AppFonts {
  static const xLargeFontPrefsWhite = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 35,
    fontWeight: FontWeight.w900,
    color: AppColors.primaryColor,
  );
  static const xLargeFontPrefsBlack = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 35,
    fontWeight: FontWeight.w900,
    color: AppColors.textPrimaryColor,
  );
  static const largeFontPrefsBlack = TextStyle(
    fontSize: 24.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w800,
    height: 1.5,
    color: AppColors.textPrimaryColor,
  );
  static const largeFontPrefsWhite = TextStyle(
    fontSize: 24.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w800,
    height: 1.5,
    color: AppColors.primaryColor,
  );
  static const mediumFontPrefsBlack = TextStyle(
    fontSize: 16.0,
    color: AppColors.textPrimaryColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static const mediumFontPrefsWhite = TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static const mediumFontPrefsWhiteLink = TextStyle(
    fontSize: 16.0,
    color: AppColors.primaryColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
    decoration: TextDecoration.underline,
  );
  static const mediumFontPrefsBlackLink = TextStyle(
    fontSize: 16.0,
    color: AppColors.textPrimaryColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
    decoration: TextDecoration.underline,
  );
  static const mediumFontPrefsRedLink = TextStyle(
    fontSize: 16.0,
    color: AppColors.linkColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
    decoration: TextDecoration.underline,
  );
  static const smallFontPrefsBlack = TextStyle(
    fontSize: 10.0,
    color: AppColors.textPrimaryColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
  static const smallFontPrefsWhite = TextStyle(
    fontSize: 10.0,
    color: AppColors.primaryColor,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    height: 1.5,
  );
}
