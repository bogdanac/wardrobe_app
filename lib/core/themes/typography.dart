import 'package:flutter/material.dart';

class AppTypography {
  // Font families
  static const String primaryFont = 'Inter'; // Using Inter as fallback since it's more readily available
  
  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  
  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 32,
    fontWeight: bold,
    height: 1.2,
    letterSpacing: -0.5,
  );
  
  static const TextStyle h2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 28,
    fontWeight: semiBold,
    height: 1.3,
    letterSpacing: -0.3,
  );
  
  static const TextStyle h3 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: semiBold,
    height: 1.3,
    letterSpacing: -0.2,
  );
  
  static const TextStyle h4 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: semiBold,
    height: 1.4,
  );
  
  static const TextStyle h5 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: medium,
    height: 1.4,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: medium,
    height: 1.4,
  );
  
  static const TextStyle h6 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: medium,
    height: 1.4,
  );
  
  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: regular,
    height: 1.5,
    letterSpacing: 0.1,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: regular,
    height: 1.5,
    letterSpacing: 0.1,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: regular,
    height: 1.4,
    letterSpacing: 0.2,
  );
  
  // Labels and buttons
  static const TextStyle labelLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: medium,
    height: 1.4,
    letterSpacing: 0.5,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: medium,
    height: 1.3,
    letterSpacing: 0.5,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: medium,
    height: 1.2,
    letterSpacing: 0.5,
  );
  
  // Specialized styles
  static const TextStyle button = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: medium,
    height: 1.2,
    letterSpacing: 0.8,
  );
  
  static const TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: regular,
    height: 1.3,
    letterSpacing: 0.4,
  );
  
  static const TextStyle overline = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: medium,
    height: 1.2,
    letterSpacing: 1.2,
  );
  
  // Custom app-specific styles
  static const TextStyle cardTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: semiBold,
    height: 1.3,
  );
  
  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: regular,
    height: 1.3,
    letterSpacing: 0.2,
  );
  
  static const TextStyle price = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: bold,
    height: 1.2,
  );
  
  static const TextStyle badge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0.5,
  );
}

// Text style extensions for easy theme-aware usage
extension TextStyleExtensions on TextStyle {
  TextStyle get light => copyWith(color: Colors.white);
  TextStyle get dark => copyWith(color: Colors.black);
  TextStyle get muted => copyWith(color: Colors.grey);
  TextStyle get primary => copyWith(color: const Color(0xFFFFB3D1));
  TextStyle get accent => copyWith(color: const Color(0xFFFFD700));
}