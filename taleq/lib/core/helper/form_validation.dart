import 'package:easy_localization/easy_localization.dart';
import 'package:taleq/core/constants/constants.dart';

class FormValidation {
  static validateInput(String? value, RegExp pattern, String? patternRules) {
    if (value == null || value.isEmpty) {
      return Constants.requiredField.tr();
    }
    if (!pattern.hasMatch(value)) {
      return patternRules ?? 'Invalid Input';
    }
    return null;
  }

  static String? confirmPassword({
    required String password,
    required String confirmPassword,
    String? patternRules,
  }) {
    if (confirmPassword != password) {
      return patternRules;
    } else if (confirmPassword.isEmpty) {
      return Constants.requiredField.tr();
    }
    return null;
  }
}
