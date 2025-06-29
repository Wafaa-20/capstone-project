// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'otp_model.dart';

class OTPModelMapper extends ClassMapperBase<OTPModel> {
  OTPModelMapper._();

  static OTPModelMapper? _instance;
  static OTPModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OTPModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OTPModel';

  static const Field<OTPModel, dynamic> _f$email =
      Field('email', null, mode: FieldMode.param);
  static const Field<OTPModel, dynamic> _f$code =
      Field('code', null, mode: FieldMode.param);

  @override
  final MappableFields<OTPModel> fields = const {
    #email: _f$email,
    #code: _f$code,
  };

  static OTPModel _instantiate(DecodingData data) {
    return OTPModel(email: data.dec(_f$email), code: data.dec(_f$code));
  }

  @override
  final Function instantiate = _instantiate;

  static OTPModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OTPModel>(map);
  }

  static OTPModel fromJson(String json) {
    return ensureInitialized().decodeJson<OTPModel>(json);
  }
}

mixin OTPModelMappable {
  String toJson() {
    return OTPModelMapper.ensureInitialized()
        .encodeJson<OTPModel>(this as OTPModel);
  }

  Map<String, dynamic> toMap() {
    return OTPModelMapper.ensureInitialized()
        .encodeMap<OTPModel>(this as OTPModel);
  }

  OTPModelCopyWith<OTPModel, OTPModel, OTPModel> get copyWith =>
      _OTPModelCopyWithImpl<OTPModel, OTPModel>(
          this as OTPModel, $identity, $identity);
  @override
  String toString() {
    return OTPModelMapper.ensureInitialized().stringifyValue(this as OTPModel);
  }

  @override
  bool operator ==(Object other) {
    return OTPModelMapper.ensureInitialized()
        .equalsValue(this as OTPModel, other);
  }

  @override
  int get hashCode {
    return OTPModelMapper.ensureInitialized().hashValue(this as OTPModel);
  }
}

extension OTPModelValueCopy<$R, $Out> on ObjectCopyWith<$R, OTPModel, $Out> {
  OTPModelCopyWith<$R, OTPModel, $Out> get $asOTPModel =>
      $base.as((v, t, t2) => _OTPModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OTPModelCopyWith<$R, $In extends OTPModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({dynamic email, dynamic code});
  OTPModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OTPModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OTPModel, $Out>
    implements OTPModelCopyWith<$R, OTPModel, $Out> {
  _OTPModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OTPModel> $mapper =
      OTPModelMapper.ensureInitialized();
  @override
  $R call({dynamic email, dynamic code}) =>
      $apply(FieldCopyWithData({#email: email, #code: code}));
  @override
  OTPModel $make(CopyWithData data) =>
      OTPModel(email: data.get(#email), code: data.get(#code));

  @override
  OTPModelCopyWith<$R2, OTPModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OTPModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
