import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/profile/domain/entities/profile_entity.dart';

part 'user_profile_model.mapper.dart';

@MappableClass()
class UserProfileModel extends ProfileEntity with UserProfileModelMappable {
  const UserProfileModel({
    @MappableField(key: 'full_name') required super.fullName,
    required super.email,
    @MappableField(key: 'avatar_url') required super.avatarUrl,
  });
}
