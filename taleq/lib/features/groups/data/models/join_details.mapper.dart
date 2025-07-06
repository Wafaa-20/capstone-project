// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter
import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/groups/data/models/join_details.dart';

class JoinDetailsModelMapper extends ClassMapperBase<JoinDetailsModel> {
  JoinDetailsModelMapper._();

  static JoinDetailsModelMapper? _instance;
  static JoinDetailsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JoinDetailsModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'JoinDetailsModel';

  static String _$userID(JoinDetailsModel v) => v.userID;
  static const Field<JoinDetailsModel, String> _f$userID = Field(
    'userID',
    _$userID,
  );
  static String _$token(JoinDetailsModel v) => v.token;
  static const Field<JoinDetailsModel, String> _f$token = Field(
    'token',
    _$token,
  );

  @override
  final MappableFields<JoinDetailsModel> fields = const {
    #userID: _f$userID,
    #token: _f$token,
  };

  static JoinDetailsModel _instantiate(DecodingData data) {
    return JoinDetailsModel(
      userID: data.dec(_f$userID),
      token: data.dec(_f$token),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static JoinDetailsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JoinDetailsModel>(map);
  }

  static JoinDetailsModel fromJson(String json) {
    return ensureInitialized().decodeJson<JoinDetailsModel>(json);
  }
}

mixin JoinDetailsModelMappable {
  String toJson() {
    return JoinDetailsModelMapper.ensureInitialized()
        .encodeJson<JoinDetailsModel>(this as JoinDetailsModel);
  }

  Map<String, dynamic> toMap() {
    return JoinDetailsModelMapper.ensureInitialized()
        .encodeMap<JoinDetailsModel>(this as JoinDetailsModel);
  }

  JoinDetailsModelCopyWith<JoinDetailsModel, JoinDetailsModel, JoinDetailsModel>
  get copyWith =>
      _JoinDetailsModelCopyWithImpl<JoinDetailsModel, JoinDetailsModel>(
        this as JoinDetailsModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return JoinDetailsModelMapper.ensureInitialized().stringifyValue(
      this as JoinDetailsModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return JoinDetailsModelMapper.ensureInitialized().equalsValue(
      this as JoinDetailsModel,
      other,
    );
  }

  @override
  int get hashCode {
    return JoinDetailsModelMapper.ensureInitialized().hashValue(
      this as JoinDetailsModel,
    );
  }
}

extension JoinDetailsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JoinDetailsModel, $Out> {
  JoinDetailsModelCopyWith<$R, JoinDetailsModel, $Out>
  get $asJoinDetailsModel =>
      $base.as((v, t, t2) => _JoinDetailsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JoinDetailsModelCopyWith<$R, $In extends JoinDetailsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? userID, String? token});
  JoinDetailsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _JoinDetailsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JoinDetailsModel, $Out>
    implements JoinDetailsModelCopyWith<$R, JoinDetailsModel, $Out> {
  _JoinDetailsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JoinDetailsModel> $mapper =
      JoinDetailsModelMapper.ensureInitialized();
  @override
  $R call({String? userID, String? token}) => $apply(
    FieldCopyWithData({
      if (userID != null) #userID: userID,
      if (token != null) #token: token,
    }),
  );
  @override
  JoinDetailsModel $make(CopyWithData data) => JoinDetailsModel(
    userID: data.get(#userID, or: $value.userID),
    token: data.get(#token, or: $value.token),
  );

  @override
  JoinDetailsModelCopyWith<$R2, JoinDetailsModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _JoinDetailsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
