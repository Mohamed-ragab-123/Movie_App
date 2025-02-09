import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    ),
  );
}
