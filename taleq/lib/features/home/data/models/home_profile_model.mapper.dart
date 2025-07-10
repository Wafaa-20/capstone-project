// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter



import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/home_profile_model.dart';

class HomeProfileModelMapper extends ClassMapperBase<HomeProfileModel> {
  HomeProfileModelMapper._();

  static HomeProfileModelMapper? _instance;
  static HomeProfileModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeProfileModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HomeProfileModel';

  static String _$userID(HomeProfileModel v) => v.userID;
  static const Field<HomeProfileModel, String> _f$userID =
      Field('userID', _$userID);
  static String _$fullName(HomeProfileModel v) => v.fullName;
  static const Field<HomeProfileModel, String> _f$fullName =
      Field('fullName', _$fullName);
  static String _$avatar(HomeProfileModel v) => v.avatar;
  static const Field<HomeProfileModel, String> _f$avatar =
      Field('avatar', _$avatar);

  @override
  final MappableFields<HomeProfileModel> fields = const {
    #userID: _f$userID,
    #fullName: _f$fullName,
    #avatar: _f$avatar,
  };

  static HomeProfileModel _instantiate(DecodingData data) {
    return HomeProfileModel(
        userID: data.dec(_f$userID),
        fullName: data.dec(_f$fullName),
        avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static HomeProfileModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeProfileModel>(map);
  }

  static HomeProfileModel fromJson(String json) {
    return ensureInitialized().decodeJson<HomeProfileModel>(json);
  }
}

mixin HomeProfileModelMappable {
  String toJson() {
    return HomeProfileModelMapper.ensureInitialized()
        .encodeJson<HomeProfileModel>(this as HomeProfileModel);
  }

  Map<String, dynamic> toMap() {
    return HomeProfileModelMapper.ensureInitialized()
        .encodeMap<HomeProfileModel>(this as HomeProfileModel);
  }

  HomeProfileModelCopyWith<HomeProfileModel, HomeProfileModel, HomeProfileModel>
      get copyWith =>
          _HomeProfileModelCopyWithImpl<HomeProfileModel, HomeProfileModel>(
              this as HomeProfileModel, $identity, $identity);
  @override
  String toString() {
    return HomeProfileModelMapper.ensureInitialized()
        .stringifyValue(this as HomeProfileModel);
  }

  @override
  bool operator ==(Object other) {
    return HomeProfileModelMapper.ensureInitialized()
        .equalsValue(this as HomeProfileModel, other);
  }

  @override
  int get hashCode {
    return HomeProfileModelMapper.ensureInitialized()
        .hashValue(this as HomeProfileModel);
  }
}

extension HomeProfileModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomeProfileModel, $Out> {
  HomeProfileModelCopyWith<$R, HomeProfileModel, $Out>
      get $asHomeProfileModel => $base
          .as((v, t, t2) => _HomeProfileModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HomeProfileModelCopyWith<$R, $In extends HomeProfileModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userID, String? fullName, String? avatar});
  HomeProfileModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HomeProfileModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeProfileModel, $Out>
    implements HomeProfileModelCopyWith<$R, HomeProfileModel, $Out> {
  _HomeProfileModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeProfileModel> $mapper =
      HomeProfileModelMapper.ensureInitialized();
  @override
  $R call({String? userID, String? fullName, String? avatar}) =>
      $apply(FieldCopyWithData({
        if (userID != null) #userID: userID,
        if (fullName != null) #fullName: fullName,
        if (avatar != null) #avatar: avatar
      }));
  @override
  HomeProfileModel $make(CopyWithData data) => HomeProfileModel(
      userID: data.get(#userID, or: $value.userID),
      fullName: data.get(#fullName, or: $value.fullName),
      avatar: data.get(#avatar, or: $value.avatar));

  @override
  HomeProfileModelCopyWith<$R2, HomeProfileModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomeProfileModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
