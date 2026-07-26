import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static const _fontFamily = 'Cormorant Garamond';

  static ThemeData get light {
    const base = TextTheme(
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.75,
        color: AppColors.muted,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.5,
        height: 1.6,
        color: AppColors.muted,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 42,
        height: 1.15,
        fontWeight: FontWeight.w400,
        color: AppColors.heading,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 27,
        fontWeight: FontWeight.w400,
        color: AppColors.infoTitle,
      ),
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: _fontFamily,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.sageDark,
        surface: AppColors.bg,
      ),
      textTheme: base,
    );
  }
}
