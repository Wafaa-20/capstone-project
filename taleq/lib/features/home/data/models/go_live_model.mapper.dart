// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter



import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/go_live_model.dart';

class GoLiveModelMapper extends ClassMapperBase<GoLiveModel> {
  GoLiveModelMapper._();

  static GoLiveModelMapper? _instance;
  static GoLiveModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GoLiveModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GoLiveModel';

  static int _$intUserAccount(GoLiveModel v) => v.intUserAccount;
  static const Field<GoLiveModel, int> _f$intUserAccount =
      Field('intUserAccount', _$intUserAccount);
  static String _$userAccount(GoLiveModel v) => v.userAccount;
  static const Field<GoLiveModel, String> _f$userAccount =
      Field('userAccount', _$userAccount);
  static String _$token(GoLiveModel v) => v.token;
  static const Field<GoLiveModel, String> _f$token = Field('token', _$token);
  static String _$channelName(GoLiveModel v) => v.channelName;
  static const Field<GoLiveModel, String> _f$channelName =
      Field('channelName', _$channelName);
  static String _$hostID(GoLiveModel v) => v.hostID;
  static const Field<GoLiveModel, String> _f$hostID = Field('hostID', _$hostID);

  @override
  final MappableFields<GoLiveModel> fields = const {
    #intUserAccount: _f$intUserAccount,
    #userAccount: _f$userAccount,
    #token: _f$token,
    #channelName: _f$channelName,
    #hostID: _f$hostID,
  };

  static GoLiveModel _instantiate(DecodingData data) {
    return GoLiveModel(
        intUserAccount: data.dec(_f$intUserAccount),
        userAccount: data.dec(_f$userAccount),
        token: data.dec(_f$token),
        channelName: data.dec(_f$channelName),
        hostID: data.dec(_f$hostID));
  }

  @override
  final Function instantiate = _instantiate;

  static GoLiveModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GoLiveModel>(map);
  }

  static GoLiveModel fromJson(String json) {
    return ensureInitialized().decodeJson<GoLiveModel>(json);
  }
}

mixin GoLiveModelMappable {
  String toJson() {
    return GoLiveModelMapper.ensureInitialized()
        .encodeJson<GoLiveModel>(this as GoLiveModel);
  }

  Map<String, dynamic> toMap() {
    return GoLiveModelMapper.ensureInitialized()
        .encodeMap<GoLiveModel>(this as GoLiveModel);
  }

  GoLiveModelCopyWith<GoLiveModel, GoLiveModel, GoLiveModel> get copyWith =>
      _GoLiveModelCopyWithImpl<GoLiveModel, GoLiveModel>(
          this as GoLiveModel, $identity, $identity);
  @override
  String toString() {
    return GoLiveModelMapper.ensureInitialized()
        .stringifyValue(this as GoLiveModel);
  }

  @override
  bool operator ==(Object other) {
    return GoLiveModelMapper.ensureInitialized()
        .equalsValue(this as GoLiveModel, other);
  }

  @override
  int get hashCode {
    return GoLiveModelMapper.ensureInitialized().hashValue(this as GoLiveModel);
  }
}

extension GoLiveModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GoLiveModel, $Out> {
  GoLiveModelCopyWith<$R, GoLiveModel, $Out> get $asGoLiveModel =>
      $base.as((v, t, t2) => _GoLiveModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GoLiveModelCopyWith<$R, $In extends GoLiveModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? intUserAccount,
      String? userAccount,
      String? token,
      String? channelName,
      String? hostID});
  GoLiveModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GoLiveModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GoLiveModel, $Out>
    implements GoLiveModelCopyWith<$R, GoLiveModel, $Out> {
  _GoLiveModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GoLiveModel> $mapper =
      GoLiveModelMapper.ensureInitialized();
  @override
  $R call(
          {int? intUserAccount,
          String? userAccount,
          String? token,
          String? channelName,
          String? hostID}) =>
      $apply(FieldCopyWithData({
        if (intUserAccount != null) #intUserAccount: intUserAccount,
        if (userAccount != null) #userAccount: userAccount,
        if (token != null) #token: token,
        if (channelName != null) #channelName: channelName,
        if (hostID != null) #hostID: hostID
      }));
  @override
  GoLiveModel $make(CopyWithData data) => GoLiveModel(
      intUserAccount: data.get(#intUserAccount, or: $value.intUserAccount),
      userAccount: data.get(#userAccount, or: $value.userAccount),
      token: data.get(#token, or: $value.token),
      channelName: data.get(#channelName, or: $value.channelName),
      hostID: data.get(#hostID, or: $value.hostID));

  @override
  GoLiveModelCopyWith<$R2, GoLiveModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GoLiveModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
