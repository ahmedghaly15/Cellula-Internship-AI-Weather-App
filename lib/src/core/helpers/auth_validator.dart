import 'package:internship_ai_weather_app/src/core/helpers/app_regex.dart';

class AuthValidator {
  AuthValidator._();

  static String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!AppRegex.passwordHasCapitalCharacter(value)) {
      return 'Password must contain a capital letter';
    } else if (!AppRegex.passwordHasLowercaseCharacter(value)) {
      return 'Password must contain a lowercase letter';
    } else if (!AppRegex.passwordHasNumber(value)) {
      return 'Password must contain a number';
    } else if (!AppRegex.passwordHasSpecialCharacter(value)) {
      return 'Password must contain a special character';
    }
    return null;
  }

  static String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!AppRegex.isEmailValid(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validateNameField(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateConfirmPasswordField({
    String? value,
    required String password,
    required String confirmPassword,
  }) {
    if (value!.isEmpty || password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }
}
