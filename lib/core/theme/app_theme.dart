import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static const _fontFamily = 'Georgia';

  static ThemeData get light {
    const base = TextTheme(
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.32,
        height: 1.85,
        color: AppColors.muted,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15.2,
        color: AppColors.muted,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.heading,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22.4,
        fontWeight: FontWeight.w600,
        color: AppColors.infoTitle,
      ),
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: _fontFamily,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surface: AppColors.bg,
      ),
      textTheme: base,
    );
  }
}
