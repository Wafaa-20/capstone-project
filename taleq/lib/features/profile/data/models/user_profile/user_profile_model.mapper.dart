// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_profile_model.dart';

class UserProfileModelMapper extends ClassMapperBase<UserProfileModel> {
  UserProfileModelMapper._();

  static UserProfileModelMapper? _instance;
  static UserProfileModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserProfileModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserProfileModel';

  static String _$fullName(UserProfileModel v) => v.fullName;
  static const Field<UserProfileModel, String> _f$fullName =
      Field('fullName', _$fullName, key: r'full_name');
  static String _$email(UserProfileModel v) => v.email;
  static const Field<UserProfileModel, String> _f$email =
      Field('email', _$email);
  static String? _$password(UserProfileModel v) => v.password;
  static const Field<UserProfileModel, String> _f$password =
      Field('password', _$password);
  static String? _$avatarUrl(UserProfileModel v) => v.avatarUrl;
  static const Field<UserProfileModel, String> _f$avatarUrl =
      Field('avatarUrl', _$avatarUrl, key: r'avatar_url');

  @override
  final MappableFields<UserProfileModel> fields = const {
    #fullName: _f$fullName,
    #email: _f$email,
    #password: _f$password,
    #avatarUrl: _f$avatarUrl,
  };

  static UserProfileModel _instantiate(DecodingData data) {
    return UserProfileModel(
        fullName: data.dec(_f$fullName),
        email: data.dec(_f$email),
        password: data.dec(_f$password),
        avatarUrl: data.dec(_f$avatarUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static UserProfileModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserProfileModel>(map);
  }

  static UserProfileModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserProfileModel>(json);
  }
}

mixin UserProfileModelMappable {
  String toJson() {
    return UserProfileModelMapper.ensureInitialized()
        .encodeJson<UserProfileModel>(this as UserProfileModel);
  }

  Map<String, dynamic> toMap() {
    return UserProfileModelMapper.ensureInitialized()
        .encodeMap<UserProfileModel>(this as UserProfileModel);
  }

  UserProfileModelCopyWith<UserProfileModel, UserProfileModel, UserProfileModel>
      get copyWith =>
          _UserProfileModelCopyWithImpl<UserProfileModel, UserProfileModel>(
              this as UserProfileModel, $identity, $identity);
  @override
  String toString() {
    return UserProfileModelMapper.ensureInitialized()
        .stringifyValue(this as UserProfileModel);
  }

  @override
  bool operator ==(Object other) {
    return UserProfileModelMapper.ensureInitialized()
        .equalsValue(this as UserProfileModel, other);
  }

  @override
  int get hashCode {
    return UserProfileModelMapper.ensureInitialized()
        .hashValue(this as UserProfileModel);
  }
}

extension UserProfileModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserProfileModel, $Out> {
  UserProfileModelCopyWith<$R, UserProfileModel, $Out>
      get $asUserProfileModel => $base
          .as((v, t, t2) => _UserProfileModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserProfileModelCopyWith<$R, $In extends UserProfileModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? fullName, String? email, String? password, String? avatarUrl});
  UserProfileModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserProfileModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserProfileModel, $Out>
    implements UserProfileModelCopyWith<$R, UserProfileModel, $Out> {
  _UserProfileModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserProfileModel> $mapper =
      UserProfileModelMapper.ensureInitialized();
  @override
  $R call(
          {String? fullName,
          String? email,
          Object? password = $none,
          Object? avatarUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (fullName != null) #fullName: fullName,
        if (email != null) #email: email,
        if (password != $none) #password: password,
        if (avatarUrl != $none) #avatarUrl: avatarUrl
      }));
  @override
  UserProfileModel $make(CopyWithData data) => UserProfileModel(
      fullName: data.get(#fullName, or: $value.fullName),
      email: data.get(#email, or: $value.email),
      password: data.get(#password, or: $value.password),
      avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl));

  @override
  UserProfileModelCopyWith<$R2, UserProfileModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserProfileModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
