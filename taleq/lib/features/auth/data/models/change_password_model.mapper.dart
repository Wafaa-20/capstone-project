// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'change_password_model.dart';

class ChangePasswordModelMapper extends ClassMapperBase<ChangePasswordModel> {
  ChangePasswordModelMapper._();

  static ChangePasswordModelMapper? _instance;
  static ChangePasswordModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangePasswordModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChangePasswordModel';

  static String _$password(ChangePasswordModel v) => v.password;
  static const Field<ChangePasswordModel, String> _f$password =
      Field('password', _$password);
  static String _$email(ChangePasswordModel v) => v.email;
  static const Field<ChangePasswordModel, String> _f$email =
      Field('email', _$email);

  @override
  final MappableFields<ChangePasswordModel> fields = const {
    #password: _f$password,
    #email: _f$email,
  };

  static ChangePasswordModel _instantiate(DecodingData data) {
    return ChangePasswordModel(
        password: data.dec(_f$password), email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static ChangePasswordModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangePasswordModel>(map);
  }

  static ChangePasswordModel fromJson(String json) {
    return ensureInitialized().decodeJson<ChangePasswordModel>(json);
  }
}

mixin ChangePasswordModelMappable {
  String toJson() {
    return ChangePasswordModelMapper.ensureInitialized()
        .encodeJson<ChangePasswordModel>(this as ChangePasswordModel);
  }

  Map<String, dynamic> toMap() {
    return ChangePasswordModelMapper.ensureInitialized()
        .encodeMap<ChangePasswordModel>(this as ChangePasswordModel);
  }

  ChangePasswordModelCopyWith<ChangePasswordModel, ChangePasswordModel,
      ChangePasswordModel> get copyWith => _ChangePasswordModelCopyWithImpl<
          ChangePasswordModel, ChangePasswordModel>(
      this as ChangePasswordModel, $identity, $identity);
  @override
  String toString() {
    return ChangePasswordModelMapper.ensureInitialized()
        .stringifyValue(this as ChangePasswordModel);
  }

  @override
  bool operator ==(Object other) {
    return ChangePasswordModelMapper.ensureInitialized()
        .equalsValue(this as ChangePasswordModel, other);
  }

  @override
  int get hashCode {
    return ChangePasswordModelMapper.ensureInitialized()
        .hashValue(this as ChangePasswordModel);
  }
}

extension ChangePasswordModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangePasswordModel, $Out> {
  ChangePasswordModelCopyWith<$R, ChangePasswordModel, $Out>
      get $asChangePasswordModel => $base.as(
          (v, t, t2) => _ChangePasswordModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChangePasswordModelCopyWith<$R, $In extends ChangePasswordModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? password, String? email});
  ChangePasswordModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChangePasswordModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangePasswordModel, $Out>
    implements ChangePasswordModelCopyWith<$R, ChangePasswordModel, $Out> {
  _ChangePasswordModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangePasswordModel> $mapper =
      ChangePasswordModelMapper.ensureInitialized();
  @override
  $R call({String? password, String? email}) => $apply(FieldCopyWithData({
        if (password != null) #password: password,
        if (email != null) #email: email
      }));
  @override
  ChangePasswordModel $make(CopyWithData data) => ChangePasswordModel(
      password: data.get(#password, or: $value.password),
      email: data.get(#email, or: $value.email));

  @override
  ChangePasswordModelCopyWith<$R2, ChangePasswordModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChangePasswordModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
