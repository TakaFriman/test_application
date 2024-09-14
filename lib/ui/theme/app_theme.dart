import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(255, 253, 252, 1),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Color.fromRGBO(255, 253, 252, 1),
    ),
    primaryColor: const Color.fromRGBO(255, 135, 2, 1),
    disabledColor: const Color.fromRGBO(188, 188, 191, 1),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Color.fromRGBO(35, 35, 43, 1),
        ),
      ),
      titleLarge: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Color.fromRGBO(188, 188, 191, 1),
        ),
      ),
      labelSmall: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color.fromRGBO(145, 158, 171, 1),
        ),
      ),
      titleMedium: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      displayMedium: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(188, 188, 191, 1),
        ),
      ),
      bodySmall: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          height: 1.36,
          color: Color.fromRGBO(76, 76, 105, 1),
        ),
      ),
      bodyMedium: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(35, 35, 43, 1),
        ),
      ),
    ),
  );
}
