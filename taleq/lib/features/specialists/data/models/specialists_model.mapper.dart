// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'specialists_model.dart';

class SpecialistsModelMapper extends ClassMapperBase<SpecialistsModel> {
  SpecialistsModelMapper._();

  static SpecialistsModelMapper? _instance;
  static SpecialistsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpecialistsModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SpecialistsModel';

  static int _$id(SpecialistsModel v) => v.id;
  static const Field<SpecialistsModel, int> _f$id = Field('id', _$id);
  static String _$image(SpecialistsModel v) => v.image;
  static const Field<SpecialistsModel, String> _f$image =
      Field('image', _$image);
  static String _$name(SpecialistsModel v) => v.name;
  static const Field<SpecialistsModel, String> _f$name = Field('name', _$name);
  static String _$subtitle(SpecialistsModel v) => v.subtitle;
  static const Field<SpecialistsModel, String> _f$subtitle =
      Field('subtitle', _$subtitle);
  static double _$rating(SpecialistsModel v) => v.rating;
  static const Field<SpecialistsModel, double> _f$rating =
      Field('rating', _$rating);
  static List<String>? _$description(SpecialistsModel v) => v.description;
  static const Field<SpecialistsModel, List<String>> _f$description =
      Field('description', _$description);

  @override
  final MappableFields<SpecialistsModel> fields = const {
    #id: _f$id,
    #image: _f$image,
    #name: _f$name,
    #subtitle: _f$subtitle,
    #rating: _f$rating,
    #description: _f$description,
  };

  static SpecialistsModel _instantiate(DecodingData data) {
    return SpecialistsModel(
        id: data.dec(_f$id),
        image: data.dec(_f$image),
        name: data.dec(_f$name),
        subtitle: data.dec(_f$subtitle),
        rating: data.dec(_f$rating),
        description: data.dec(_f$description));
  }

  @override
  final Function instantiate = _instantiate;

  static SpecialistsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpecialistsModel>(map);
  }

  static SpecialistsModel fromJson(String json) {
    return ensureInitialized().decodeJson<SpecialistsModel>(json);
  }
}

mixin SpecialistsModelMappable {
  String toJson() {
    return SpecialistsModelMapper.ensureInitialized()
        .encodeJson<SpecialistsModel>(this as SpecialistsModel);
  }

  Map<String, dynamic> toMap() {
    return SpecialistsModelMapper.ensureInitialized()
        .encodeMap<SpecialistsModel>(this as SpecialistsModel);
  }

  SpecialistsModelCopyWith<SpecialistsModel, SpecialistsModel, SpecialistsModel>
      get copyWith =>
          _SpecialistsModelCopyWithImpl<SpecialistsModel, SpecialistsModel>(
              this as SpecialistsModel, $identity, $identity);
  @override
  String toString() {
    return SpecialistsModelMapper.ensureInitialized()
        .stringifyValue(this as SpecialistsModel);
  }

  @override
  bool operator ==(Object other) {
    return SpecialistsModelMapper.ensureInitialized()
        .equalsValue(this as SpecialistsModel, other);
  }

  @override
  int get hashCode {
    return SpecialistsModelMapper.ensureInitialized()
        .hashValue(this as SpecialistsModel);
  }
}

extension SpecialistsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpecialistsModel, $Out> {
  SpecialistsModelCopyWith<$R, SpecialistsModel, $Out>
      get $asSpecialistsModel => $base
          .as((v, t, t2) => _SpecialistsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SpecialistsModelCopyWith<$R, $In extends SpecialistsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get description;
  $R call(
      {int? id,
      String? image,
      String? name,
      String? subtitle,
      double? rating,
      List<String>? description});
  SpecialistsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SpecialistsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpecialistsModel, $Out>
    implements SpecialistsModelCopyWith<$R, SpecialistsModel, $Out> {
  _SpecialistsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpecialistsModel> $mapper =
      SpecialistsModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get description => $value.description != null
          ? ListCopyWith(
              $value.description!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(description: v))
          : null;
  @override
  $R call(
          {int? id,
          String? image,
          String? name,
          String? subtitle,
          double? rating,
          Object? description = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (image != null) #image: image,
        if (name != null) #name: name,
        if (subtitle != null) #subtitle: subtitle,
        if (rating != null) #rating: rating,
        if (description != $none) #description: description
      }));
  @override
  SpecialistsModel $make(CopyWithData data) => SpecialistsModel(
      id: data.get(#id, or: $value.id),
      image: data.get(#image, or: $value.image),
      name: data.get(#name, or: $value.name),
      subtitle: data.get(#subtitle, or: $value.subtitle),
      rating: data.get(#rating, or: $value.rating),
      description: data.get(#description, or: $value.description));

  @override
  SpecialistsModelCopyWith<$R2, SpecialistsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SpecialistsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
