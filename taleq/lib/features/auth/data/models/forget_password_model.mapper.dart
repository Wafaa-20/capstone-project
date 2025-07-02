// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'forget_password_model.dart';

class ForgetPasswordModelMapper extends ClassMapperBase<ForgetPasswordModel> {
  ForgetPasswordModelMapper._();

  static ForgetPasswordModelMapper? _instance;
  static ForgetPasswordModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ForgetPasswordModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ForgetPasswordModel';

  static String _$email(ForgetPasswordModel v) => v.email;
  static const Field<ForgetPasswordModel, String> _f$email =
      Field('email', _$email);

  @override
  final MappableFields<ForgetPasswordModel> fields = const {
    #email: _f$email,
  };

  static ForgetPasswordModel _instantiate(DecodingData data) {
    return ForgetPasswordModel(email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static ForgetPasswordModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ForgetPasswordModel>(map);
  }

  static ForgetPasswordModel fromJson(String json) {
    return ensureInitialized().decodeJson<ForgetPasswordModel>(json);
  }
}

mixin ForgetPasswordModelMappable {
  String toJson() {
    return ForgetPasswordModelMapper.ensureInitialized()
        .encodeJson<ForgetPasswordModel>(this as ForgetPasswordModel);
  }

  Map<String, dynamic> toMap() {
    return ForgetPasswordModelMapper.ensureInitialized()
        .encodeMap<ForgetPasswordModel>(this as ForgetPasswordModel);
  }

  ForgetPasswordModelCopyWith<ForgetPasswordModel, ForgetPasswordModel,
      ForgetPasswordModel> get copyWith => _ForgetPasswordModelCopyWithImpl<
          ForgetPasswordModel, ForgetPasswordModel>(
      this as ForgetPasswordModel, $identity, $identity);
  @override
  String toString() {
    return ForgetPasswordModelMapper.ensureInitialized()
        .stringifyValue(this as ForgetPasswordModel);
  }

  @override
  bool operator ==(Object other) {
    return ForgetPasswordModelMapper.ensureInitialized()
        .equalsValue(this as ForgetPasswordModel, other);
  }

  @override
  int get hashCode {
    return ForgetPasswordModelMapper.ensureInitialized()
        .hashValue(this as ForgetPasswordModel);
  }
}

extension ForgetPasswordModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ForgetPasswordModel, $Out> {
  ForgetPasswordModelCopyWith<$R, ForgetPasswordModel, $Out>
      get $asForgetPasswordModel => $base.as(
          (v, t, t2) => _ForgetPasswordModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ForgetPasswordModelCopyWith<$R, $In extends ForgetPasswordModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email});
  ForgetPasswordModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ForgetPasswordModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ForgetPasswordModel, $Out>
    implements ForgetPasswordModelCopyWith<$R, ForgetPasswordModel, $Out> {
  _ForgetPasswordModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ForgetPasswordModel> $mapper =
      ForgetPasswordModelMapper.ensureInitialized();
  @override
  $R call({String? email}) =>
      $apply(FieldCopyWithData({if (email != null) #email: email}));
  @override
  ForgetPasswordModel $make(CopyWithData data) =>
      ForgetPasswordModel(email: data.get(#email, or: $value.email));

  @override
  ForgetPasswordModelCopyWith<$R2, ForgetPasswordModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ForgetPasswordModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
