import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/auth/data/models/auth_model.dart';
import 'package:taleq/features/auth/data/models/otp_model.dart';

abstract class AuthRemoteDatasource {
  Future<AuthModel> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<AuthModel> login({required String email, required String password});
  Future signupWithGoogleAuth();
  Future signupWithAppleAuth();
  Future<OTPModel> otpAuth({required String email, required String code});
}

class SupabaseDatasource implements AuthRemoteDatasource {
  final SupabaseClient supabase;

  SupabaseDatasource({required this.supabase});

  // Login With Email and password Method With Supabase
  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      log('before supabase$email');
      log(password);
      final userAuth = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      log('after supabase$email');
      log(password);
      log('supabase$userAuth');
      log(userAuth.user.toString());
      final user = userAuth.user;
      if (user == null) {
        throw FormatException("Invalid email or password");
      }

      final userInfo = await supabase
          .from('user_profiles')
          .select('full_name')
          .eq('user_id', user.id)
          .single();
      log(userInfo.toString());
      return AuthModel(
        id: user.id,
        name: userInfo['name'] ?? 'No Name',
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("There is error with logIn");
    }
  }

  // Sign up With Email and password Method with Supabase
  @override
  Future<AuthModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        throw const FormatException("لم يتم إنشاء المستخدم.");
      }

      // يمكنك حفظ الاسم في بيانات المستخدم إن أردت:
      await supabase.from('user_profiles').insert({
        'user_id': user.id,
        'full_name': name,
      });

      return AuthModel(
        id: user.id,
        name: name,
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      log('❌ AuthException: ${e.message}');
      throw FormatException(e.message);
    } catch (e, stackTrace) {
      log('❌ Unexpected error: $e');
      log('📍 StackTrace: $stackTrace');
      throw const FormatException("حدث خطأ أثناء إنشاء الحساب.");
    }
  }

  @override
  Future signupWithGoogleAuth() async {
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'com.taleq://login-callback',
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
    } on AuthException catch (e) {
      throw FormatException(e.message);
    }
  }

  @override
  Future signupWithAppleAuth() async {
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: 'com.taleq://login-callback',
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
    } on AuthException catch (e) {
      throw FormatException(e.message);
    }
  }

  @override
  Future<OTPModel> otpAuth({
    required String email,
    required String code,
  }) async {
    try {
      final response = await supabase.auth.verifyOTP(
        email: email,
        token: code,
        type: OtpType.email,
      );

      final user = response.user;
      final session = response.session;

      if (user == null) {
        throw const FormatException("لم يتم التحقق من المستخدم.");
      }

      return OTPModel(email: email, code: code);
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw const FormatException("حدث خطأ أثناء التحقق من الرمز.");
    }
  }
}
