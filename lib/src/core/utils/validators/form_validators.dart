import 'package:nutri_plate/src/core/helper/extensions/string_extensions.dart';
import 'package:nutri_plate/src/core/utils/constants/app_strings.dart';

class FormValidators {
  FormValidators._();

  static String? email(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.emptyEmail;
    }
    if (!value!.isValidEmail) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.emptyPassword;
    }
    if (!value!.isValidPassword) {
      return AppStrings.invalidPassword;
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value.isNullOrEmpty) {
      return AppStrings.emptyPassword;
    }
    if (value != password) {
      return AppStrings.passwordMismatch;
    }
    return null;
  }

  static String? required(String? value, [String? fieldName]) {
    if (value.isNullOrEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value.isNullOrEmpty) {
      return 'Phone number is required';
    }
    if (!value!.isValidPhone) {
      return 'Invalid phone number format';
    }
    return null;
  }

  static String? minLength(String? value, int minLength, [String? fieldName]) {
    if (value.isNullOrEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    if (value!.length < minLength) {
      return '${fieldName ?? 'This field'} must be at least $minLength characters';
    }
    return null;
  }

  static String? maxLength(String? value, int maxLength, [String? fieldName]) {
    if (value != null && value.length > maxLength) {
      return '${fieldName ?? 'This field'} must be at most $maxLength characters';
    }
    return null;
  }
}
