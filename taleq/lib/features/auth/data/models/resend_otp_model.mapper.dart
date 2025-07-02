// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'resend_otp_model.dart';

class ResendOTPModelMapper extends ClassMapperBase<ResendOTPModel> {
  ResendOTPModelMapper._();

  static ResendOTPModelMapper? _instance;
  static ResendOTPModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResendOTPModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResendOTPModel';

  static String _$email(ResendOTPModel v) => v.email;
  static const Field<ResendOTPModel, String> _f$email = Field('email', _$email);

  @override
  final MappableFields<ResendOTPModel> fields = const {
    #email: _f$email,
  };

  static ResendOTPModel _instantiate(DecodingData data) {
    return ResendOTPModel(email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static ResendOTPModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResendOTPModel>(map);
  }

  static ResendOTPModel fromJson(String json) {
    return ensureInitialized().decodeJson<ResendOTPModel>(json);
  }
}

mixin ResendOTPModelMappable {
  String toJson() {
    return ResendOTPModelMapper.ensureInitialized()
        .encodeJson<ResendOTPModel>(this as ResendOTPModel);
  }

  Map<String, dynamic> toMap() {
    return ResendOTPModelMapper.ensureInitialized()
        .encodeMap<ResendOTPModel>(this as ResendOTPModel);
  }

  ResendOTPModelCopyWith<ResendOTPModel, ResendOTPModel, ResendOTPModel>
      get copyWith =>
          _ResendOTPModelCopyWithImpl<ResendOTPModel, ResendOTPModel>(
              this as ResendOTPModel, $identity, $identity);
  @override
  String toString() {
    return ResendOTPModelMapper.ensureInitialized()
        .stringifyValue(this as ResendOTPModel);
  }

  @override
  bool operator ==(Object other) {
    return ResendOTPModelMapper.ensureInitialized()
        .equalsValue(this as ResendOTPModel, other);
  }

  @override
  int get hashCode {
    return ResendOTPModelMapper.ensureInitialized()
        .hashValue(this as ResendOTPModel);
  }
}

extension ResendOTPModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResendOTPModel, $Out> {
  ResendOTPModelCopyWith<$R, ResendOTPModel, $Out> get $asResendOTPModel =>
      $base.as((v, t, t2) => _ResendOTPModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResendOTPModelCopyWith<$R, $In extends ResendOTPModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email});
  ResendOTPModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ResendOTPModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResendOTPModel, $Out>
    implements ResendOTPModelCopyWith<$R, ResendOTPModel, $Out> {
  _ResendOTPModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResendOTPModel> $mapper =
      ResendOTPModelMapper.ensureInitialized();
  @override
  $R call({String? email}) =>
      $apply(FieldCopyWithData({if (email != null) #email: email}));
  @override
  ResendOTPModel $make(CopyWithData data) =>
      ResendOTPModel(email: data.get(#email, or: $value.email));

  @override
  ResendOTPModelCopyWith<$R2, ResendOTPModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ResendOTPModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
