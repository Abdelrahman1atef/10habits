import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

/// نظام الأصول المطور - Modern Assets Management
/// تنظيم هرمي وسهل للوصول لجميع موارد التطبيق
class AppAssets {
  AppAssets._();

  // ==================== IMAGE ASSETS ====================
  static const images = _Images();

  // ==================== ICON ASSETS ====================
  static const icons = _Icons();

  // ==================== Lottie ASSETS ====================
  static const lotties = _Lottie();

  // ==================== HELPER METHODS ====================

  /// عرض صورة عادية
  static Widget image(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) => Image.asset(path, width: width, height: height, fit: fit, color: color);

  /// عرض أيقونة SVG
  static Widget svg(
    String path, {
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) => SvgPicture.asset(
    path,
    width: width,
    height: height,
    fit: fit,
    colorFilter: color != null
        ? ColorFilter.mode(color, BlendMode.srcIn)
        : null,
  );

  static Widget lottie(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    bool? repeat = true,
  }) => LottieBuilder.asset(
    path,
    width: width,
    height: height,
    fit: fit,
    repeat: repeat,
  );
}

class _Lottie {
  const _Lottie();

  final String _base = 'assets/lottie';

  String get fireStreak => '$_base/fire_streak.json';
  String get quran => '$_base/quran.json';
  String get manReadsQuran => '$_base/man_reads_quran.json';
}

class _Images {
  const _Images();

  final String _base = 'assets/images';

  String get splash => '$_base/splash.png';

  String get splashWhite => '$_base/splash_white.png';

  String get logo => '$_base/logo.png';

  String get logoSvg => '$_base/logo.svg';

  String get logoWhite => '$_base/logoWhite.png';

  String get onboarding1 => '$_base/onboarding1.svg';

  String get onboarding2 => '$_base/onboarding2.svg';

  String get placeholder => '$_base/placeholder.png';

  String get error => '$_base/error.png';

  String get success => '$_base/success.png';

  String get loading => '$_base/loading.png';

  String get backGround => '$_base/background.jpg';
}

class _Icons {
  const _Icons();

  final String _base = 'assets/icons';

  String get book => '$_base/book.svg';
  String get stars => '$_base/stars.svg';

}
