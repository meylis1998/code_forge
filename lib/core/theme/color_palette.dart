import 'package:flutter/material.dart';

class ColorPalette {
  const ColorPalette._();

  // Primary
  static const Color primary = Color(0xFF5C6BC0);
  static const Color primaryLight = Color(0xFF8E99A4);
  static const Color primaryDark = Color(0xFF3949AB);

  // Accent
  static const Color accent = Color(0xFF00BCD4);
  static const Color accentLight = Color(0xFF4DD0E1);

  // Difficulty colors
  static const Color easy = Color(0xFF00B8A3);
  static const Color medium = Color(0xFFFFC01E);
  static const Color hard = Color(0xFFFF375F);

  // Status colors
  static const Color accepted = Color(0xFF00B8A3);
  static const Color wrongAnswer = Color(0xFFFF375F);
  static const Color timeLimitExceeded = Color(0xFFFFC01E);
  static const Color runtimeError = Color(0xFFFF6B6B);
  static const Color compileError = Color(0xFFFF9800);

  // Background (dark theme)
  static const Color darkBg = Color(0xFF1A1A2E);
  static const Color darkSurface = Color(0xFF16213E);
  static const Color darkCard = Color(0xFF1E2D4A);
  static const Color darkSidebar = Color(0xFF0F1628);
  static const Color darkDivider = Color(0xFF2A3550);

  // Background (light theme)
  static const Color lightBg = Color(0xFFF5F6FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightSidebar = Color(0xFFF0F1F5);
  static const Color lightDivider = Color(0xFFE0E0E0);

  // Text
  static const Color darkTextPrimary = Color(0xFFEEEEEE);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
  static const Color lightTextPrimary = Color(0xFF1A1A2E);
  static const Color lightTextSecondary = Color(0xFF666666);

  // Editor
  static const Color editorBg = Color(0xFF1E1E1E);
  static const Color editorLineNumber = Color(0xFF858585);
  static const Color editorSelection = Color(0xFF264F78);
  static const Color editorCursor = Color(0xFFAEAFAD);

  // Heatmap
  static const Color heatmapEmpty = Color(0xFF2D333B);
  static const Color heatmapLevel1 = Color(0xFF0E4429);
  static const Color heatmapLevel2 = Color(0xFF006D32);
  static const Color heatmapLevel3 = Color(0xFF26A641);
  static const Color heatmapLevel4 = Color(0xFF39D353);

  static Color difficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return easy;
      case 'medium':
        return medium;
      case 'hard':
        return hard;
      default:
        return primaryLight;
    }
  }

  static Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
        return accepted;
      case 'wrong answer':
        return wrongAnswer;
      case 'time limit exceeded':
        return timeLimitExceeded;
      case 'runtime error':
        return runtimeError;
      case 'compile error':
        return compileError;
      default:
        return primaryLight;
    }
  }
}
