import 'package:abher/core/app_strings/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class FormValidator {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredField.tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredPhone.tr();
    }
    if (value.length < 8) {
      return AppStrings.phoneDoseNotMatch.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredEmail.tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.wrongEmailValidation.tr();
    }
    return null;
  }

  static String? validateRequired(dynamic value, String errorMessage) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return errorMessage;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredPassword.tr();
    }
    if (value.length < 6) {
      return AppStrings.smallPassword.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordValidation.tr();
    }
    if (value != password) {
      return AppStrings.passwordNotMatch.tr();
    }
    return null;
  }
}
