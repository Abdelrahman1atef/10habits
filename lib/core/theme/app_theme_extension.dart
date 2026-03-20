import 'package:flutter/material.dart';

/// Custom theme extension for Habits app specific styles
class HabitsThemeExtension extends ThemeExtension<HabitsThemeExtension> {
  final TextStyle? quranStyle;

  const HabitsThemeExtension({
    required this.quranStyle,
  });

  @override
  HabitsThemeExtension copyWith({
    TextStyle? quranStyle,
  }) {
    return HabitsThemeExtension(
      quranStyle: quranStyle ?? this.quranStyle,
    );
  }

  @override
  HabitsThemeExtension lerp(ThemeExtension<HabitsThemeExtension>? other, double t) {
    if (other is! HabitsThemeExtension) {
      return this;
    }
    return HabitsThemeExtension(
      quranStyle: TextStyle.lerp(quranStyle, other.quranStyle, t),
    );
  }
}
