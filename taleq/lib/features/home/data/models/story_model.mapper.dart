// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter



import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/story_model.dart';

class StoryModelMapper extends ClassMapperBase<StoryModel> {
  StoryModelMapper._();

  static StoryModelMapper? _instance;
  static StoryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoryModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StoryModel';

  static String _$fullName(StoryModel v) => v.fullName;
  static const Field<StoryModel, String> _f$fullName =
      Field('fullName', _$fullName);
  static String _$image(StoryModel v) => v.image;
  static const Field<StoryModel, String> _f$image = Field('image', _$image);
  static String _$title(StoryModel v) => v.title;
  static const Field<StoryModel, String> _f$title = Field('title', _$title);
  static String _$content(StoryModel v) => v.content;
  static const Field<StoryModel, String> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<StoryModel> fields = const {
    #fullName: _f$fullName,
    #image: _f$image,
    #title: _f$title,
    #content: _f$content,
  };

  static StoryModel _instantiate(DecodingData data) {
    return StoryModel(
        fullName: data.dec(_f$fullName),
        image: data.dec(_f$image),
        title: data.dec(_f$title),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static StoryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoryModel>(map);
  }

  static StoryModel fromJson(String json) {
    return ensureInitialized().decodeJson<StoryModel>(json);
  }
}

mixin StoryModelMappable {
  String toJson() {
    return StoryModelMapper.ensureInitialized()
        .encodeJson<StoryModel>(this as StoryModel);
  }

  Map<String, dynamic> toMap() {
    return StoryModelMapper.ensureInitialized()
        .encodeMap<StoryModel>(this as StoryModel);
  }

  StoryModelCopyWith<StoryModel, StoryModel, StoryModel> get copyWith =>
      _StoryModelCopyWithImpl<StoryModel, StoryModel>(
          this as StoryModel, $identity, $identity);
  @override
  String toString() {
    return StoryModelMapper.ensureInitialized()
        .stringifyValue(this as StoryModel);
  }

  @override
  bool operator ==(Object other) {
    return StoryModelMapper.ensureInitialized()
        .equalsValue(this as StoryModel, other);
  }

  @override
  int get hashCode {
    return StoryModelMapper.ensureInitialized().hashValue(this as StoryModel);
  }
}

extension StoryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoryModel, $Out> {
  StoryModelCopyWith<$R, StoryModel, $Out> get $asStoryModel =>
      $base.as((v, t, t2) => _StoryModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StoryModelCopyWith<$R, $In extends StoryModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? fullName, String? image, String? title, String? content});
  StoryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoryModel, $Out>
    implements StoryModelCopyWith<$R, StoryModel, $Out> {
  _StoryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoryModel> $mapper =
      StoryModelMapper.ensureInitialized();
  @override
  $R call({String? fullName, String? image, String? title, String? content}) =>
      $apply(FieldCopyWithData({
        if (fullName != null) #fullName: fullName,
        if (image != null) #image: image,
        if (title != null) #title: title,
        if (content != null) #content: content
      }));
  @override
  StoryModel $make(CopyWithData data) => StoryModel(
      fullName: data.get(#fullName, or: $value.fullName),
      image: data.get(#image, or: $value.image),
      title: data.get(#title, or: $value.title),
      content: data.get(#content, or: $value.content));

  @override
  StoryModelCopyWith<$R2, StoryModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StoryModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
