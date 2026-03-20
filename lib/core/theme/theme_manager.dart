import 'package:flutter/material.dart';
import 'package:habits10/core/theme/app_colors.dart';
import 'package:habits10/core/theme/app_typography.dart';
import 'package:habits10/core/theme/app_theme_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeManager {
  AppThemeManager._();

  static final AppThemeManager _instance = AppThemeManager._();
  static AppThemeManager get instance => _instance;

  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

  static ThemeData getThemeData(Brightness brightness, Locale locale) {
    final bool isDark = brightness == Brightness.dark;
    final colorScheme = isDark ? AppColors.darkColorScheme : AppColors.lightColorScheme;
    
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isDark ? colorScheme.surface : AppColors.backgroundLight,
      fontFamily: AppStyles.getFontFamily(locale), 
      textTheme: AppStyles.createTextTheme(locale),
      
      // Custom extensions
      extensions: [
        HabitsThemeExtension(
          quranStyle: AppStyles.quranText.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ],
      
      // Component themes
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppStyles.createTextTheme(locale).titleLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: AppStyles.createTextTheme(locale).labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedTheme = prefs.getString('theme_mode');

    if (savedTheme != null) {
      themeNotifier.value = ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }
  }

  void setLightTheme() {
    themeNotifier.value = ThemeMode.light;
    _saveTheme();
  }

  void setDarkTheme() {
    themeNotifier.value = ThemeMode.dark;
    _saveTheme();
  }

  void setSystemTheme() {
    themeNotifier.value = ThemeMode.system;
    _saveTheme();
  }

  void toggleTheme() {
    if (themeNotifier.value == ThemeMode.light) {
      themeNotifier.value = ThemeMode.dark;
    } else {
      themeNotifier.value = ThemeMode.light;
    }
    _saveTheme();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', themeNotifier.value.toString());
  }
}
