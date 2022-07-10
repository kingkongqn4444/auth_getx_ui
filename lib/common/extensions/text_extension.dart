import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/theme.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get thin => weight(FontWeight.w100);

  TextStyle get extraLight => weight(FontWeight.w200);

  TextStyle get light => weight(FontWeight.w300);

  TextStyle get regular => weight(FontWeight.w400);

  TextStyle get medium => weight(FontWeight.w500);

  TextStyle get semiBold => weight(FontWeight.w600);

  TextStyle get bold => weight(FontWeight.w700);

  TextStyle get maxWeight => weight(FontWeight.w900);

  TextStyle get italic => fontStyleT(FontStyle.italic);

  TextStyle get normal => fontStyleT(FontStyle.normal);

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle textColor(Color v) => copyWith(color: v);

  TextStyle weight(FontWeight v) => GoogleFonts.montserrat(textStyle: this, fontWeight: v);

  TextStyle fontStyleT(FontStyle v) => copyWith(fontStyle: v);

  TextStyle setDecoration(TextDecoration v) => copyWith(decoration: v);

  TextStyle letterSpaC(double v) => copyWith(letterSpacing: v);

  TextStyle heightLine(double v) => copyWith(height: v / fontSize!);

  TextStyle get textBlack44350D0p08 => textColor(AssetColors.black44350D0p08);

  TextStyle get textBlack44350D => textColor(AssetColors.black44350D);

  TextStyle get textBlack44350D0p6 => textColor(AssetColors.black44350D0p6);

  TextStyle get textBlack44350D0p32 => textColor(AssetColors.black44350D0p32);

  TextStyle get textRedF63057 => textColor(AssetColors.redF63057);

  TextStyle get textGreen52CB67 => textColor(AssetColors.green52CB67);

  TextStyle get textWhite => textColor(Colors.white);

  TextStyle get textWhite0p6 => textColor(Colors.white60);

  TextStyle get textPrimary => textColor(AssetColors.primary);

  TextStyle get decorationUnderline => setDecoration(TextDecoration.underline);
}
