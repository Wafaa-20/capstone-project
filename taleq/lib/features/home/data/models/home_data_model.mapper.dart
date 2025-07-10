// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter



import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/home_data_model.dart';
import 'package:taleq/features/home/data/models/home_profile_model.dart';
import 'package:taleq/features/home/data/models/home_profile_model.mapper.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/specialist_model.mapper.dart';
import 'package:taleq/features/home/data/models/story_model.dart';
import 'package:taleq/features/home/data/models/story_model.mapper.dart';

class HomeDataModelMapper extends ClassMapperBase<HomeDataModel> {
  HomeDataModelMapper._();

  static HomeDataModelMapper? _instance;
  static HomeDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeDataModelMapper._());
      SpecialistModelMapper.ensureInitialized();
      StoryModelMapper.ensureInitialized();
      HomeProfileModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeDataModel';

  static List<SpecialistModel> _$specialists(HomeDataModel v) => v.specialists;
  static const Field<HomeDataModel, List<SpecialistModel>> _f$specialists =
      Field('specialists', _$specialists);
  static List<StoryModel> _$stories(HomeDataModel v) => v.stories;
  static const Field<HomeDataModel, List<StoryModel>> _f$stories =
      Field('stories', _$stories);
  static HomeProfileModel _$profile(HomeDataModel v) => v.profile;
  static const Field<HomeDataModel, HomeProfileModel> _f$profile =
      Field('profile', _$profile);

  @override
  final MappableFields<HomeDataModel> fields = const {
    #specialists: _f$specialists,
    #stories: _f$stories,
    #profile: _f$profile,
  };

  static HomeDataModel _instantiate(DecodingData data) {
    return HomeDataModel(
        specialists: data.dec(_f$specialists),
        stories: data.dec(_f$stories),
        profile: data.dec(_f$profile));
  }

  @override
  final Function instantiate = _instantiate;

  static HomeDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeDataModel>(map);
  }

  static HomeDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<HomeDataModel>(json);
  }
}

mixin HomeDataModelMappable {
  String toJson() {
    return HomeDataModelMapper.ensureInitialized()
        .encodeJson<HomeDataModel>(this as HomeDataModel);
  }

  Map<String, dynamic> toMap() {
    return HomeDataModelMapper.ensureInitialized()
        .encodeMap<HomeDataModel>(this as HomeDataModel);
  }

  HomeDataModelCopyWith<HomeDataModel, HomeDataModel, HomeDataModel>
      get copyWith => _HomeDataModelCopyWithImpl<HomeDataModel, HomeDataModel>(
          this as HomeDataModel, $identity, $identity);
  @override
  String toString() {
    return HomeDataModelMapper.ensureInitialized()
        .stringifyValue(this as HomeDataModel);
  }

  @override
  bool operator ==(Object other) {
    return HomeDataModelMapper.ensureInitialized()
        .equalsValue(this as HomeDataModel, other);
  }

  @override
  int get hashCode {
    return HomeDataModelMapper.ensureInitialized()
        .hashValue(this as HomeDataModel);
  }
}

extension HomeDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomeDataModel, $Out> {
  HomeDataModelCopyWith<$R, HomeDataModel, $Out> get $asHomeDataModel =>
      $base.as((v, t, t2) => _HomeDataModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HomeDataModelCopyWith<$R, $In extends HomeDataModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SpecialistModel,
          SpecialistModelCopyWith<$R, SpecialistModel, SpecialistModel>>
      get specialists;
  ListCopyWith<$R, StoryModel, StoryModelCopyWith<$R, StoryModel, StoryModel>>
      get stories;
  HomeProfileModelCopyWith<$R, HomeProfileModel, HomeProfileModel> get profile;
  $R call(
      {List<SpecialistModel>? specialists,
      List<StoryModel>? stories,
      HomeProfileModel? profile});
  HomeDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HomeDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeDataModel, $Out>
    implements HomeDataModelCopyWith<$R, HomeDataModel, $Out> {
  _HomeDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeDataModel> $mapper =
      HomeDataModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SpecialistModel,
          SpecialistModelCopyWith<$R, SpecialistModel, SpecialistModel>>
      get specialists => ListCopyWith($value.specialists,
          (v, t) => v.copyWith.$chain(t), (v) => call(specialists: v));
  @override
  ListCopyWith<$R, StoryModel, StoryModelCopyWith<$R, StoryModel, StoryModel>>
      get stories => ListCopyWith($value.stories,
          (v, t) => v.copyWith.$chain(t), (v) => call(stories: v));
  @override
  HomeProfileModelCopyWith<$R, HomeProfileModel, HomeProfileModel>
      get profile => $value.profile.copyWith.$chain((v) => call(profile: v));
  @override
  $R call(
          {List<SpecialistModel>? specialists,
          List<StoryModel>? stories,
          HomeProfileModel? profile}) =>
      $apply(FieldCopyWithData({
        if (specialists != null) #specialists: specialists,
        if (stories != null) #stories: stories,
        if (profile != null) #profile: profile
      }));
  @override
  HomeDataModel $make(CopyWithData data) => HomeDataModel(
      specialists: data.get(#specialists, or: $value.specialists),
      stories: data.get(#stories, or: $value.stories),
      profile: data.get(#profile, or: $value.profile));

  @override
  HomeDataModelCopyWith<$R2, HomeDataModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomeDataModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
