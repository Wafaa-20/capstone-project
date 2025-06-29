class Constants {
  static const String usernameRules = "على الاقل 8 أحرف تحتوي حرف كبير و صغير";
  static RegExp usernameRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{9,}$');
  static const String emailRules =
      "يجب أن يكون بريدًا إلكترونيًا صالحًا مثل example@domain.com";
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static const String passwordRules =
      "على الأقل 8 أحرف، تحتوي على حرف كبير وصغير";
  static RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$');
  static const String usernameSignupRules =
      "على الاقل 4 أحرف تحتوي حرف كبير و صغير";
  static RegExp usernameSignupRegExp = RegExp(r'^[a-zA-Z0-9]{4,}$');
  static const String emailSignupRules =
      "يجب أن يكون بريدًا إلكترونيًا صالحًا مثل example@domain.com";
  static RegExp emailSignupRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static const String passwordSignupRules =
      "على الأقل 8 أحرف، تحتوي على حرف كبير وصغير";
  static RegExp passwordSignupRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$');
}
