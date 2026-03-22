import 'package:flutter/material.dart';

/// Semantic color tokens for the Habits app.
/// This follows Material 3 naming conventions where possible.
class AppColors {
  AppColors._();

  // ==================== BRAND COLORS (RAW) ====================
  static const Color primaryGreen = Color(0xFF2E7D6B);
  static const Color secondaryOrange = Color(0xFFF4A261);
  static const Color tertiaryBrown = Color(0xFF8E4E14);
  static const Color backgroundLight = Color(0xFFFAF7F2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color errorRed = Color(0xFFD32F2F);
  static const Color successGreen = Color(0xFF388E3C);
  
  // ==================== LEGACY / CONVENIENCE STATIC COLORS ====================
  static const Color primary = primaryGreen;
  static const Color secondary = secondaryOrange;
  static const Color error = errorRed;
  static const Color success = successGreen;
  static const Color textPrimary = Color(0xFF1C1B1B);
  static const Color textSecondary = Color(0xFF49454E);
  static const Color textHint = Color(0xFF938F99);
  static const Color disabled = Color(0xFFE0E0E0);
  static const Color buttonDisabled = Color(0xFFA3A3A3);
  static const Color borderGrey = Color(0xFFDADADA);
  
  static const Color primaryTeal = Color(0xFF2EC5D7); // Original Abher teal
  static const Color primaryNavy = Color(0xFF174862); // Original Abher navy
  static const Color lightWhite = Color(0xFFF9F9F9);
  static const Color accentGrey = Color(0xFF7D7D7D);
  static const Color onPrimary = white;
  static const Color onSurface = Color(0xFF1C1B1B);

  static const Color grey1 = Color(0xFFE6E6E6);
  static const Color grey4 = Color(0xFF999999);
  static const Color grey5 = Color(0xFF808080);
  static const Color grey6 = Color(0xFF666666);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);

  // ==================== SEMANTIC SCHEMES ====================

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryGreen,
    onPrimary: white,
    primaryContainer: Color(0xFFB5EAD7),
    onPrimaryContainer: Color(0xFF002118),
    secondary: secondaryOrange,
    onSecondary: white,
    secondaryContainer: Color(0xFFFFDDB3),
    onSecondaryContainer: Color(0xFF291800),
    error: errorRed,
    onError: white,
    surface: white,
    onSurface: textPrimary,
    surfaceContainerHighest: Color(0xFFE7E0E0),
    onSurfaceVariant: textSecondary,
    outline: Color(0xFF79747E),
    shadow: black,
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFF86D7B7),
    surfaceTint: primaryGreen,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF86D7B7),
    onPrimary: Color(0xFF00382B),
    primaryContainer: Color(0xFF00513F),
    onPrimaryContainer: Color(0xFFB5EAD7),
    secondary: Color(0xFFFFB951),
    onSecondary: Color(0xFF452B00),
    secondaryContainer: Color(0xFF633F00),
    onSecondaryContainer: Color(0xFFFFDDB3),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    surface: Color(0xFF1C1B1B),
    onSurface: Color(0xFFE6E1E5),
    surfaceContainerHighest: Color(0xFF49454E),
    onSurfaceVariant: Color(0xFFCAC4D0),
    outline: Color(0xFF938F99),
    shadow: black,
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: primaryGreen,
    surfaceTint: Color(0xFF86D7B7),
  );

  // ==================== DYNAMIC ACCESSORS ====================
  static Color background(BuildContext context) => Theme.of(context).scaffoldBackgroundColor;
  static Color borderColor(BuildContext context) => Theme.of(context).colorScheme.outline.withValues(alpha: 0.2);
}
