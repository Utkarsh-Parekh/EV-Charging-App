import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme{

  static TextTheme lightTextTheme =  TextTheme(
    bodyLarge:GoogleFonts.manrope(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w700
    ),
      bodySmall:GoogleFonts.manrope(
          color: Colors.black,
          fontSize: 12
      ),
    bodyMedium:GoogleFonts.manrope(
        color: Colors.black,
        fontSize: 14
    ),
    titleLarge: GoogleFonts.manrope(
      color: Colors.black,
      fontSize: 18,
    ),



  );
  static TextTheme darkTextTheme = TextTheme(
      bodyLarge:GoogleFonts.manrope(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16
      ),
    bodyMedium:GoogleFonts.manrope(
        color: Colors.white,
        fontSize: 14
    ),
      titleLarge: GoogleFonts.manrope(
          color: Colors.white,
          fontSize: 20
      ),
    bodySmall:GoogleFonts.manrope(
        color: Colors.white,
        fontSize: 14
    ),
  );

}