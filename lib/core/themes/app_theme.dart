import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'typography.dart';
import '../../domain/entities/clothing_item.dart';

class AppTheme {
  // Re-export colors for backward compatibility
  static const Color primaryBlack = AppColors.primaryBlack;
  static const Color primaryWhite = AppColors.primaryWhite;
  static const Color pastelPink = AppColors.pastelPink;
  static const Color darkerPink = AppColors.darkerPink;
  static const Color gold = AppColors.gold;
  static const Color lightGray = AppColors.lightGray;
  static const Color mediumGray = AppColors.mediumGray;
  static const Color darkGray = AppColors.darkGray;
  
  // Status colors for error handling
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppTypography.primaryFont,
      textTheme: _buildTextTheme(Brightness.dark),
      scaffoldBackgroundColor: primaryBlack,
      colorScheme: const ColorScheme.dark(
        primary: primaryWhite,
        secondary: pastelPink,
        tertiary: gold,
        surface: lightGray,
        onPrimary: primaryBlack,
        onSecondary: primaryBlack,
        onTertiary: primaryBlack,
        onSurface: primaryWhite,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlack,
        foregroundColor: primaryWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: primaryWhite,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryWhite,
          foregroundColor: primaryBlack,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryWhite,
          side: const BorderSide(color: primaryWhite, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: pastelPink,
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryWhite, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: const TextStyle(
          color: mediumGray,
          fontFamily: 'Poppins',
        ),
      ),
      cardTheme: CardThemeData(
        color: lightGray,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: pastelPink,
        foregroundColor: primaryBlack,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryBlack,
        selectedItemColor: primaryWhite,
        unselectedItemColor: mediumGray,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: lightGray,
        selectedColor: pastelPink,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: primaryWhite,
        ),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  // Build text theme based on brightness
  static TextTheme _buildTextTheme(Brightness brightness) {
    final Color textColor = brightness == Brightness.dark ? primaryWhite : primaryBlack;
    final Color mutedColor = brightness == Brightness.dark ? mediumGray : darkGray;
    
    return TextTheme(
      displayLarge: AppTypography.h1.copyWith(color: textColor),
      displayMedium: AppTypography.h2.copyWith(color: textColor),
      displaySmall: AppTypography.h3.copyWith(color: textColor),
      headlineLarge: AppTypography.h4.copyWith(color: textColor),
      headlineMedium: AppTypography.h5.copyWith(color: textColor),
      headlineSmall: AppTypography.h6.copyWith(color: textColor),
      titleLarge: AppTypography.cardTitle.copyWith(color: textColor),
      titleMedium: AppTypography.labelLarge.copyWith(color: textColor),
      titleSmall: AppTypography.labelMedium.copyWith(color: textColor),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: textColor),
      bodyMedium: AppTypography.bodyMedium.copyWith(color: textColor),
      bodySmall: AppTypography.bodySmall.copyWith(color: mutedColor),
      labelLarge: AppTypography.button.copyWith(color: textColor),
      labelMedium: AppTypography.labelMedium.copyWith(color: textColor),
      labelSmall: AppTypography.labelSmall.copyWith(color: mutedColor),
    );
  }

  // Helper method to get seasonal colors
  static List<Color> getSeasonalColors(Season season) {
    return AppColors.getSeasonalColors(season);
  }

  // Helper method to check color compatibility
  static bool areColorsCompatible(Color color1, Color color2) {
    return AppColors.areColorsCompatible(color1, color2);
  }
}