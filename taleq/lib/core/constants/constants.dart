class Constants {
  static const String usernameRules = "على الاقل 4 أحرف ";
  static RegExp usernameRegExp = RegExp(r'^[a-zA-Z]{4,}$');
  static const String emailRules =
      "يجب أن يكون بريدًا إلكترونيًا صالحًا مثل example@domain.com";
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static const String passwordRules =
      "على الأقل 8 أحرف، تحتوي على حرف كبير وصغير";
  static RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$');
  static const String requiredField = "هذا الحقل مطلوب";
}
