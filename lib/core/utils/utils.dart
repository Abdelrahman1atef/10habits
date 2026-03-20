import 'dart:math';
import 'validation_utils.dart';

/// General helper utilities
class Utils {
  Utils._();

  /// Current language - updated by app
  static String lang = 'ar';

  // ==================== GENERATORS ====================

  /// Generate random barcode
  static String generateBarcode() {
    return (Random().nextInt(99999999) + 10000000).toString();
  }

  /// Generate unique ID
  static String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  // ==================== VALIDATION HELPERS ====================

  /// Check if email is valid
  static bool isValidEmail(String email) {
    return ValidationUtils.emailValidation(email) == null;
  }

  /// Check if phone is valid
  static bool isValidPhone(String phone) {
    return ValidationUtils.phoneValidation(phone) == null;
  }

  // ==================== STRING UTILITIES ====================

  /// Clean text from extra spaces
  static String cleanText(String text) {
    return text.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Convert text to title case
  static String toTitleCase(String text) {
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }
}
