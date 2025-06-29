// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'questionnaire_model.dart';

class UserAnswerModelMapper extends ClassMapperBase<UserAnswerModel> {
  UserAnswerModelMapper._();

  static UserAnswerModelMapper? _instance;
  static UserAnswerModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAnswerModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserAnswerModel';

  static Map<String, int> _$answers(UserAnswerModel v) => v.answers;
  static const Field<UserAnswerModel, Map<String, int>> _f$answers =
      Field('answers', _$answers);

  @override
  final MappableFields<UserAnswerModel> fields = const {
    #answers: _f$answers,
  };

  static UserAnswerModel _instantiate(DecodingData data) {
    return UserAnswerModel(answers: data.dec(_f$answers));
  }

  @override
  final Function instantiate = _instantiate;

  static UserAnswerModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserAnswerModel>(map);
  }

  static UserAnswerModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserAnswerModel>(json);
  }
}

mixin UserAnswerModelMappable {
  String toJson() {
    return UserAnswerModelMapper.ensureInitialized()
        .encodeJson<UserAnswerModel>(this as UserAnswerModel);
  }

  Map<String, dynamic> toMap() {
    return UserAnswerModelMapper.ensureInitialized()
        .encodeMap<UserAnswerModel>(this as UserAnswerModel);
  }

  UserAnswerModelCopyWith<UserAnswerModel, UserAnswerModel, UserAnswerModel>
      get copyWith =>
          _UserAnswerModelCopyWithImpl<UserAnswerModel, UserAnswerModel>(
              this as UserAnswerModel, $identity, $identity);
  @override
  String toString() {
    return UserAnswerModelMapper.ensureInitialized()
        .stringifyValue(this as UserAnswerModel);
  }

  @override
  bool operator ==(Object other) {
    return UserAnswerModelMapper.ensureInitialized()
        .equalsValue(this as UserAnswerModel, other);
  }

  @override
  int get hashCode {
    return UserAnswerModelMapper.ensureInitialized()
        .hashValue(this as UserAnswerModel);
  }
}

extension UserAnswerModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserAnswerModel, $Out> {
  UserAnswerModelCopyWith<$R, UserAnswerModel, $Out> get $asUserAnswerModel =>
      $base.as((v, t, t2) => _UserAnswerModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserAnswerModelCopyWith<$R, $In extends UserAnswerModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, int, ObjectCopyWith<$R, int, int>> get answers;
  $R call({Map<String, int>? answers});
  UserAnswerModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserAnswerModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserAnswerModel, $Out>
    implements UserAnswerModelCopyWith<$R, UserAnswerModel, $Out> {
  _UserAnswerModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserAnswerModel> $mapper =
      UserAnswerModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, int, ObjectCopyWith<$R, int, int>> get answers =>
      MapCopyWith($value.answers, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(answers: v));
  @override
  $R call({Map<String, int>? answers}) =>
      $apply(FieldCopyWithData({if (answers != null) #answers: answers}));
  @override
  UserAnswerModel $make(CopyWithData data) =>
      UserAnswerModel(answers: data.get(#answers, or: $value.answers));

  @override
  UserAnswerModelCopyWith<$R2, UserAnswerModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserAnswerModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
