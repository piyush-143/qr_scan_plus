import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_plus/core/constants/color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: CustomColor.bgColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      primaryColor: CustomColor.goldColor,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.itim(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: CustomColor.goldColor,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: CustomColor.goldColor,
        ),
      ),
    );
  }

  // Define shared text styles for easy reuse
  static TextStyle get titleStyle => GoogleFonts.itim(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: CustomColor.goldColor,
      );

  static TextStyle get bodyMediumStyle => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  static TextStyle get buttonTextStyle => GoogleFonts.roboto(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: CustomColor.goldColor,
      );
}
