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
      displayLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, height: 1.2),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, height: 1.2),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, height: 1.2),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1.2),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.2),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.2),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 1.2),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.2),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.2),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, height: 1.5),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, height: 1.5),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.2),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.2),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, height: 1.2),
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
  
  static TextStyle _base(double size, {FontWeight weight = FontWeight.normal}) => TextStyle(
    fontFamily: englishFontFamily,
    fontSize: size,
    fontWeight: weight,
    height: 1.2,
  );

  static TextStyle get s10Medium => _base(10, weight: FontWeight.w500);
  static TextStyle get s10Bold => _base(10, weight: FontWeight.bold);
  static TextStyle get s12Medium => _base(12, weight: FontWeight.w500);
  static TextStyle get s12Bold => _base(12, weight: FontWeight.bold);
  static TextStyle get s13Medium => _base(13, weight: FontWeight.w500);
  static TextStyle get s13Bold => _base(13, weight: FontWeight.bold);
  static TextStyle get s14Light => _base(14, weight: FontWeight.w300);
  static TextStyle get s14Medium => _base(14, weight: FontWeight.w500);
  static TextStyle get s14SemiBold => _base(14, weight: FontWeight.w600);
  static TextStyle get s14Bold => _base(14, weight: FontWeight.bold);
  static TextStyle get s16Medium => _base(16, weight: FontWeight.w500);
  static TextStyle get s16SemiBold => _base(16, weight: FontWeight.w600);
  static TextStyle get s16Bold => _base(16, weight: FontWeight.bold);
  static TextStyle get s18Medium => _base(18, weight: FontWeight.w500);
  static TextStyle get s18Bold => _base(18, weight: FontWeight.bold);
  static TextStyle get s20SemiBold => _base(20, weight: FontWeight.w600);
  static TextStyle get s20Bold => _base(20, weight: FontWeight.bold);
  static TextStyle get s24Bold => _base(24, weight: FontWeight.bold);
  static TextStyle get s26Bold => _base(26, weight: FontWeight.bold);
}

/// Legacy helper for text sizes
abstract class AppTextSizes {
  static TextStyle _base(double size) => TextStyle(
    fontFamily: AppStyles.englishFontFamily,
    fontSize: size,
    fontWeight: FontWeight.w400,
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
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
}
