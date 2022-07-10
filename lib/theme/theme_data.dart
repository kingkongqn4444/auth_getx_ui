import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

class BaseAppThemeData {
  static final themeData = ThemeData(
    colorScheme: _colorScheme,
    primaryColor: _colorScheme.primaryVariant,
    fontFamily: GoogleFonts.lato().fontFamily,
    canvasColor: _colorScheme.background,
    toggleableActiveColor: _colorScheme.primary,
    indicatorColor: _colorScheme.onPrimary,
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: _colorScheme.background,
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),

    textTheme: _textTheme,
    // tabBarTheme: TabBarTheme(
    //   labelColor: Colors.black,
    //   labelPadding: const EdgeInsets.symmetric(horizontal: 2),
    //   unselectedLabelColor: AssetColors.grey9A9A9D,
    //   labelStyle: _textTheme.subtitle1,
    //   unselectedLabelStyle: _textTheme.subtitle1,
    // ),
    // input
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        minimumSize: const Size(56.0, 45.0),
        padding: const EdgeInsets.all(12),
        primary: AssetColors.primaryTwo,
        onPrimary: Colors.white,
        onSurface: AssetColors.black44350D0p08,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: AssetColors.primaryTwo,
        textStyle: const TextStyle(
            color: AssetColors.yellowD3A429,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.12),
        onSurface: AssetColors.black44350D0p08,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AssetColors.black44350D,
        padding: EdgeInsets.zero,
        minimumSize: const Size(76.0, 45.0),
        textStyle: const TextStyle(
            color: AssetColors.black44350D, fontWeight: FontWeight.w600, fontSize: 14),
        side: BorderSide(
          width: 1,
          color: AssetColors.black44350D0p6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: _textTheme.bodyText1!.copyWith(color: AssetColors.black44350D0p32),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AssetColors.greyE8E8E8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AssetColors.greyE8E8E8),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AssetColors.greyE8E8E8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AssetColors.redF63057, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AssetColors.greyE8E8E8),
      ),
      errorStyle: const TextStyle(fontSize: 12, color: AssetColors.redF63057),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      isCollapsed: true,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      color: Colors.white,
    ),
  );

  static const _regular = FontWeight.w400;
  static const _bool = FontWeight.w600;
  static const _medium = FontWeight.w500;

  static const _colorScheme = ColorScheme(
    primary: AssetColors.primary,
    primaryVariant: AssetColors.primaryTwo,
    secondary: AssetColors.primary,
    secondaryVariant: Color(0xFFC77D02),
    background: AssetColors.primaryTwo,
    onBackground: Color(0xffF5F5F8),
    surface: Colors.black,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    brightness: Brightness.light,
  );

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontWeight: _bool,
        fontSize: 56.0,
        height: 60 / 56,
        color: AssetColors.black44350D,
        letterSpacing: 0.4),
    headline2: GoogleFonts.montserrat(
        fontWeight: _bool,
        fontSize: 40,
        height: 46 / 40,
        color: AssetColors.black44350D,
        letterSpacing: 0.2),
    headline3: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: 28,
        height: 34 / 28,
        color: AssetColors.black44350D,
        letterSpacing: 0.2),
    headline4: GoogleFonts.montserrat(
        fontWeight: _bool,
        fontSize: 26,
        height: 34 / 26.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.2),
    headline5: GoogleFonts.montserrat(
        fontWeight: _bool,
        fontSize: 20.0,
        height: 26.0 / 20.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.2),
    headline6: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: 18.0,
        height: 24.0 / 18,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    subtitle1: GoogleFonts.montserrat(
        fontWeight: _medium,
        fontSize: 16.0,
        height: 24.0 / 16.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    subtitle2: GoogleFonts.montserrat(
        fontWeight: _bool,
        fontSize: 14.0,
        height: 20 / 14.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    bodyText1: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: 16.0,
        height: 24.0 / 16.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    bodyText2: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: 14.0,
        height: 20.0 / 14.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    button: GoogleFonts.montserrat(
        fontWeight: _bool,
        fontSize: 14.0,
        height: 18.0 / 15.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    caption: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: 13.0,
        height: 16.0 / 13.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
    overline: GoogleFonts.montserrat(
        fontWeight: _regular,
        fontSize: 12.0,
        height: 16.0 / 12.0,
        color: AssetColors.black44350D,
        letterSpacing: 0.1),
  );
}
