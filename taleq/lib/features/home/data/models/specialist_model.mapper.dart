// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter



import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';

class SpecialistModelMapper extends ClassMapperBase<SpecialistModel> {
  SpecialistModelMapper._();

  static SpecialistModelMapper? _instance;
  static SpecialistModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpecialistModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SpecialistModel';

  static String _$id(SpecialistModel v) => v.id;
  static const Field<SpecialistModel, String> _f$id = Field('id', _$id);
  static String _$image(SpecialistModel v) => v.image;
  static const Field<SpecialistModel, String> _f$image =
      Field('image', _$image);

  @override
  final MappableFields<SpecialistModel> fields = const {
    #id: _f$id,
    #image: _f$image,
  };

  static SpecialistModel _instantiate(DecodingData data) {
    return SpecialistModel(id: data.dec(_f$id), image: data.dec(_f$image));
  }

  @override
  final Function instantiate = _instantiate;

  static SpecialistModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpecialistModel>(map);
  }

  static SpecialistModel fromJson(String json) {
    return ensureInitialized().decodeJson<SpecialistModel>(json);
  }
}

mixin SpecialistModelMappable {
  String toJson() {
    return SpecialistModelMapper.ensureInitialized()
        .encodeJson<SpecialistModel>(this as SpecialistModel);
  }

  Map<String, dynamic> toMap() {
    return SpecialistModelMapper.ensureInitialized()
        .encodeMap<SpecialistModel>(this as SpecialistModel);
  }

  SpecialistModelCopyWith<SpecialistModel, SpecialistModel, SpecialistModel>
      get copyWith =>
          _SpecialistModelCopyWithImpl<SpecialistModel, SpecialistModel>(
              this as SpecialistModel, $identity, $identity);
  @override
  String toString() {
    return SpecialistModelMapper.ensureInitialized()
        .stringifyValue(this as SpecialistModel);
  }

  @override
  bool operator ==(Object other) {
    return SpecialistModelMapper.ensureInitialized()
        .equalsValue(this as SpecialistModel, other);
  }

  @override
  int get hashCode {
    return SpecialistModelMapper.ensureInitialized()
        .hashValue(this as SpecialistModel);
  }
}

extension SpecialistModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpecialistModel, $Out> {
  SpecialistModelCopyWith<$R, SpecialistModel, $Out> get $asSpecialistModel =>
      $base.as((v, t, t2) => _SpecialistModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SpecialistModelCopyWith<$R, $In extends SpecialistModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? image});
  SpecialistModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SpecialistModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpecialistModel, $Out>
    implements SpecialistModelCopyWith<$R, SpecialistModel, $Out> {
  _SpecialistModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpecialistModel> $mapper =
      SpecialistModelMapper.ensureInitialized();
  @override
  $R call({String? id, String? image}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (image != null) #image: image}));
  @override
  SpecialistModel $make(CopyWithData data) => SpecialistModel(
      id: data.get(#id, or: $value.id),
      image: data.get(#image, or: $value.image));

  @override
  SpecialistModelCopyWith<$R2, SpecialistModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SpecialistModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
