import 'dart:ui';
import 'package:flutter/material.dart';

/// Typography system for the Habits app.
/// Uses 'Cairo' for Arabic and 'Inter' for English.
abstract class AppStyles {
  static const String arabicFontFamily = 'Cairo';
  static const String englishFontFamily = 'Inter';
  static const String quranFontFamily = 'AmiriQuran';

  static String getFontFamily(Locale locale) {
    return locale.languageCode == 'ar' ? arabicFontFamily : englishFontFamily;
  }

  static TextTheme createTextTheme(Locale locale) {
    final fontFamily = getFontFamily(locale);

    return TextTheme(
      displayLarge: const TextStyle(fontSize: 56, fontVariations: [FontVariation('wght', 700)], height: 1.2),
      displayMedium: const TextStyle(fontSize: 45, fontVariations: [FontVariation('wght', 700)], height: 1.2),
      displaySmall: const TextStyle(fontSize: 36, fontVariations: [FontVariation('wght', 700)], height: 1.2),
      headlineLarge: const TextStyle(fontSize: 32, fontVariations: [FontVariation('wght', 700)], height: 1.2),
      headlineMedium: const TextStyle(fontSize: 28, fontVariations: [FontVariation('wght', 700)], height: 1.2),
      headlineSmall: const TextStyle(fontSize: 24, fontVariations: [FontVariation('wght', 600)], height: 1.2),
      titleLarge: const TextStyle(fontSize: 22, fontVariations: [FontVariation('wght', 600)], height: 1.2),
      titleMedium: const TextStyle(fontSize: 18, fontVariations: [FontVariation('wght', 500)], height: 1.2),
      titleSmall: const TextStyle(fontSize: 14, fontVariations: [FontVariation('wght', 500)], height: 1.2),
      bodyLarge: const TextStyle(fontSize: 16, fontVariations: [FontVariation('wght', 400)], height: 1.5),
      bodyMedium: const TextStyle(fontSize: 14, fontVariations: [FontVariation('wght', 400)], height: 1.5),
      bodySmall: const TextStyle(fontSize: 12, fontVariations: [FontVariation('wght', 400)], height: 1.5),
      labelLarge: const TextStyle(fontSize: 14, fontVariations: [FontVariation('wght', 500)], height: 1.2),
      labelMedium: const TextStyle(fontSize: 12, fontVariations: [FontVariation('wght', 500)], height: 1.2),
      labelSmall: const TextStyle(fontSize: 11, fontVariations: [FontVariation('wght', 500)], height: 1.2),
    ).apply(
      fontFamily: fontFamily,
    );
  }

  static TextStyle get quranText => const TextStyle(
        fontFamily: quranFontFamily,
        fontSize: 28,
        height: 2.0,
      );

  // ==================== LEGACY ALIASES (FOR BACKWARD COMPATIBILITY) ====================
  
  static TextStyle _base(double size, {double weight = 400}) => TextStyle(
    fontSize: size,
    fontVariations: [FontVariation('wght', weight)],
    height: 1.2,
  );

  static TextStyle get s10Medium => _base(10, weight: 500);
  static TextStyle get s10Bold => _base(10, weight: 700);
  static TextStyle get s12Medium => _base(12, weight: 500);
  static TextStyle get s12Bold => _base(12, weight: 700);
  static TextStyle get s13Medium => _base(13, weight: 500);
  static TextStyle get s13Bold => _base(13, weight: 700);
  static TextStyle get s14Light => _base(14, weight: 300);
  static TextStyle get s14Medium => _base(14, weight: 500);
  static TextStyle get s14SemiBold => _base(14, weight: 600);
  static TextStyle get s14Bold => _base(14, weight: 700);
  static TextStyle get s16Medium => _base(16, weight: 500);
  static TextStyle get s16SemiBold => _base(16, weight: 600);
  static TextStyle get s16Bold => _base(16, weight: 700);
  static TextStyle get s18Medium => _base(18, weight: 500);
  static TextStyle get s18Bold => _base(18, weight: 700);
  static TextStyle get s20SemiBold => _base(20, weight: 600);
  static TextStyle get s20Bold => _base(20, weight: 700);
  static TextStyle get s24Bold => _base(24, weight: 700);
  static TextStyle get s26Bold => _base(26, weight: 700);
}

/// Legacy helper for text sizes
abstract class AppTextSizes {
  static TextStyle _base(double size) => TextStyle(
    fontSize: size,
    fontVariations: const [FontVariation('wght', 400)],
    height: 1.2,
  );

  static TextStyle get s10 => _base(10);
  static TextStyle get s12 => _base(12);
  static TextStyle get s13 => _base(13);
  static TextStyle get s14 => _base(14);
  static TextStyle get s16 => _base(16);
  static TextStyle get s18 => _base(18);
  static TextStyle get s20 => _base(20);
  static TextStyle get s24 => _base(24);
  static TextStyle get s26 => _base(26);
  static TextStyle get s28 => _base(28);
  static TextStyle get s32 => _base(32);
}

/// Helper extension to access styles directly from context
extension AppStylesX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension TextStyleX on TextStyle {
  TextStyle get light => copyWith(fontVariations: const [FontVariation('wght', 300)]);
  TextStyle get regular => copyWith(fontVariations: const [FontVariation('wght', 400)]);
  TextStyle get medium => copyWith(fontVariations: const [FontVariation('wght', 500)]);
  TextStyle get semiBold => copyWith(fontVariations: const [FontVariation('wght', 600)]);
  TextStyle get bold => copyWith(fontVariations: const [FontVariation('wght', 700)]);
  TextStyle get extraBold => copyWith(fontVariations: const [FontVariation('wght', 800)]);

  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
}
