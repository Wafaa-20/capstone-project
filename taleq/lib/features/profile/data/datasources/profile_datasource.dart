import 'dart:io';

import 'package:path/path.dart' as imgPath;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/profile/data/models/user_profile/user_profile_model.dart';

abstract class ProfileDatasource {
  Future<UserProfileModel> getProfile();
  Future<UserProfileModel> updateProfile({
    required String fullName,
    required String email,
    required String password,
    required String avatarUrl,
  });
  Future<UserProfileModel> uploadAvatar({required File imageFile});
  Future<void> signOut();
}

class ProfileDatasourceImpl implements ProfileDatasource {
  final SupabaseClient supabase;

  ProfileDatasourceImpl({required this.supabase});

  //Get User Profile
  @override
  Future<UserProfileModel> getProfile() async {
    try {
      final user = supabase.auth.currentUser;
      final response = await supabase
          .from('user_profiles')
          .select('full_name, avatar_url')
          .eq('user_id', user!.id)
          .single();
      final dataMap = (response);
      dataMap['email'] = user.email;
      return UserProfileModelMapper.fromMap(dataMap);
    } catch (e) {
      throw FormatException('Failed to load profile for: $e');
    }
  }

  // Update User Profile
  @override
  Future<UserProfileModel> updateProfile({
    required String fullName,
    required String email,
    required String password,
    required String avatarUrl,
  }) async {
    try {
      final updatedModel = UserProfileModel(
        fullName: fullName,
        email: email,
        password: password,
        avatarUrl: avatarUrl,
      );
      //Convert Model To MAP With User ProfileModel Mapper
      final updateData = updatedModel.toMap();
      final user = supabase.auth.currentUser!.id;

      final update = supabase
          .from('user_profiles')
          .update(updateData)
          .eq('user_id', user)
          .select()
          .single();
      return UserProfileModelMapper.fromMap(update as Map<String, dynamic>);
    } catch (e) {
      throw FormatException('Failed to update profile: $e');
    }
  }

  //Upload Avatar User Chosen it
  @override
  Future<UserProfileModel> uploadAvatar({required File imageFile}) async {
    try {
      //jpg ,png ,...
      final imagePath = imgPath.extension(imageFile.path);
      final user = supabase.auth.currentUser!.id;
      //store in this path in supabase
      final path = 'avatars/$user/avatar$imagePath';
      //Upload Image to avatars Storage in Supabase
      await supabase.storage
          .from('avatars')
          .uploadBinary(path, await imageFile.readAsBytes());

      //Get The Public Url
      final publicUrl = supabase.storage.from('avatars').getPublicUrl(path);
      //Update Avatar Url in User Profile table
      final updateAvatarUrl = await supabase
          .from('user_profiles')
          .update({'avatar_url': publicUrl})
          .eq('user_id', user)
          .select()
          .single();

      return UserProfileModelMapper.fromMap(updateAvatarUrl);
    } catch (e) {
      throw FormatException('Failed to upload avatar: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("Failed to signOut: $e");
    }
  }
}
