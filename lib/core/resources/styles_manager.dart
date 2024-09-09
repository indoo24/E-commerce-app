import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.cairo(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getLightStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getRegularStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return getTextStyle(fontSize, FontWeightManager.bold, color);
}
