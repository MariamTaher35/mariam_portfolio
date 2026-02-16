import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Girly Beige & Brown Palette - Warm & Feminine
  static const Color bgBeige = Color(0xFFF5F1E8);
  static const Color bgCream = Color(0xFFFFFBF5);
  static const Color surfaceCard = Color(0xFFFFFFFB);

  // Brown tones
  static const Color accentBrown = Color(0xFF8B6F47);
  static const Color accentDarkBrown = Color(0xFF6B5844);
  static const Color accentLightBrown = Color(0xFFA88B68);

  // Warm accent colors
  static const Color accentRose = Color(0xFFE8B4A8);
  static const Color accentPeach = Color(0xFFFFD4C4);
  static const Color accentGold = Color(0xFFD4AF6A);
  static const Color accentTerracotta = Color(0xFFCB9B8C);
  static const Color accentSage = Color(0xFFA8B89B);
  static const Color accentMauve = Color(0xFFD4ADB7);

  // Text colors
  static const Color textMain = Color(0xFF4A3F35);
  static const Color textSecondary = Color(0xFF7A6F65);
  static const Color textDim = Color(0xFF9C8D82);

  // Borders and shadows
  static const Color borderLight = Color(0xFFE8DFD0);
  static const Color shadowColor = Color(0x12000000);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: bgBeige,
    primaryColor: accentBrown,
    colorScheme: const ColorScheme.light(
      primary: accentBrown,
      secondary: accentRose,
      surface: surfaceCard,
      background: bgBeige,
    ),
    textTheme: GoogleFonts.cormorantGaramondTextTheme().copyWith(
      displayLarge: GoogleFonts.cormorantGaramond(
        fontSize: 72,
        fontWeight: FontWeight.w600,
        color: textMain,
        letterSpacing: -2,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.cormorantGaramond(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        color: textMain,
        letterSpacing: -1,
        height: 1.2,
      ),
      headlineMedium: GoogleFonts.cormorantGaramond(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: textMain,
        height: 1.3,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 18,
        color: textSecondary,
        height: 1.8,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 16,
        color: textSecondary,
        height: 1.7,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}