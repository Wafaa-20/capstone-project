class FormValidation {
  static validateInput(String? value, RegExp pattern, String? patternRules) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!pattern.hasMatch(value)) {
      return patternRules ?? 'Invalid Input';
    }
    return null;
  }

  static String? confirmPassword({
    required String password,
    required String confirmPassword,
  }) {
    if (confirmPassword != password) {
      return "Passwords do not match";
    } else if (confirmPassword.isEmpty) {
      return "This field is required";
    }
    return null;
  }
}
