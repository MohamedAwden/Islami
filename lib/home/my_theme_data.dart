import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/extinsions/font_extinsion.dart';

import 'app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primary
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      backgroundColor: AppColors.primary,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,

    ),
      textTheme: TextTheme(

      headlineLarge: GoogleFonts.elMessiri(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
          headlineMedium: GoogleFonts.elMessiri(
            fontSize: 24.tx,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          headlineSmall: GoogleFonts.elMessiri(
            fontSize: 16.tx,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        titleLarge: GoogleFonts.elMessiri(
          fontSize: 24.tx,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
  )
  );
}