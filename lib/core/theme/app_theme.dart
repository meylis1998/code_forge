import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palette.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: ColorPalette.primary,
        secondary: ColorPalette.accent,
        surface: ColorPalette.darkSurface,
        error: ColorPalette.wrongAnswer,
      ),
      scaffoldBackgroundColor: ColorPalette.darkBg,
      cardColor: ColorPalette.darkCard,
      dividerColor: ColorPalette.darkDivider,
      textTheme: _buildTextTheme(Brightness.dark),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPalette.darkSurface,
        foregroundColor: ColorPalette.darkTextPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: ColorPalette.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: ColorPalette.darkDivider),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorPalette.darkCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.darkDivider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.darkDivider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: ColorPalette.darkCard,
        selectedColor: ColorPalette.primary.withValues(alpha: 0.3),
        labelStyle: const TextStyle(fontSize: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: ColorPalette.darkDivider),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: ColorPalette.darkCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: ColorPalette.darkDivider),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorPalette.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorPalette.darkCard,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: ColorPalette.darkDivider),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: ColorPalette.primary,
        secondary: ColorPalette.accent,
        surface: ColorPalette.lightSurface,
        error: ColorPalette.wrongAnswer,
      ),
      scaffoldBackgroundColor: ColorPalette.lightBg,
      cardColor: ColorPalette.lightCard,
      dividerColor: ColorPalette.lightDivider,
      textTheme: _buildTextTheme(Brightness.light),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPalette.lightSurface,
        foregroundColor: ColorPalette.lightTextPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: ColorPalette.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: ColorPalette.lightDivider),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorPalette.lightBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.lightDivider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.lightDivider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: ColorPalette.lightBg,
        selectedColor: ColorPalette.primary.withValues(alpha: 0.15),
        labelStyle: const TextStyle(fontSize: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: ColorPalette.lightDivider),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorPalette.lightSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final color = brightness == Brightness.dark
        ? ColorPalette.darkTextPrimary
        : ColorPalette.lightTextPrimary;

    return TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: color,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: color,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        color: brightness == Brightness.dark
            ? ColorPalette.darkTextSecondary
            : ColorPalette.lightTextSecondary,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        color: brightness == Brightness.dark
            ? ColorPalette.darkTextSecondary
            : ColorPalette.lightTextSecondary,
      ),
    );
  }

  static TextStyle get editorTextStyle {
    return GoogleFonts.jetBrainsMono(
      fontSize: 14,
      height: 1.5,
    );
  }
}
