import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getWhiteFont(
    {FontWeight fontweight = FontWeight.bold,
    double size = 20,
    Color color = Colors.white}) {
  return TextStyle(fontWeight: fontweight, fontSize: size, color: color);
}

TextStyle getBlackFont(
    {FontWeight fontweight = FontWeight.w400,
    double size = 25,
    Color color = Colors.black}) {
  return TextStyle(fontWeight: fontweight, fontSize: size, color: color);
}

TextStyle getWhitePacificoFont(
    {FontWeight fontweight = FontWeight.w400,
    double size = 25,
    Color color = Colors.white}) {
  return GoogleFonts.pacifico(
      fontWeight: fontweight, fontSize: size, color: color);
}
