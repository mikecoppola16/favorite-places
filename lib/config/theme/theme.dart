import 'package:favorite_places/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData().copyWith(
      appBarTheme: const AppBarTheme(
        color: AppColor.darkPurple,
      ),
      scaffoldBackgroundColor: AppColor.colorScheme.surface,
      colorScheme: AppColor.colorScheme,
      textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
        titleSmall: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.ubuntuCondensed(
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.ubuntuCondensed(
          color: const Color.fromARGB(255, 220, 218, 241)
        )
      ));

  //TODO static ThemeData lightTheme = ThemeData();
}
