// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/space/data/models/space_model.dart';

class SpaceListsModelMapper extends ClassMapperBase<SpaceListsModel> {
  SpaceListsModelMapper._();

  static SpaceListsModelMapper? _instance;
  static SpaceListsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpaceListsModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SpaceListsModel';

  static String _$id(SpaceListsModel v) => v.id;
  static const Field<SpaceListsModel, String> _f$id = Field('id', _$id);
  static String _$name(SpaceListsModel v) => v.name;
  static const Field<SpaceListsModel, String> _f$name = Field('name', _$name);
  static String _$channelName(SpaceListsModel v) => v.channelName;
  static const Field<SpaceListsModel, String> _f$channelName = Field(
    'channelName',
    _$channelName,
  );
  static List<Map<String, dynamic>> _$users(SpaceListsModel v) => v.users;
  static const Field<SpaceListsModel, List<Map<String, dynamic>>> _f$users =
      Field('users', _$users);
  static List<Map<String, dynamic>> _$comments(SpaceListsModel v) => v.comments;
  static const Field<SpaceListsModel, List<Map<String, dynamic>>> _f$comments =
      Field('comments', _$comments);

  @override
  final MappableFields<SpaceListsModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #channelName: _f$channelName,
    #users: _f$users,
    #comments: _f$comments,
  };

  static SpaceListsModel _instantiate(DecodingData data) {
    return SpaceListsModel(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      channelName: data.dec(_f$channelName),
      users: data.dec(_f$users),
      comments: data.dec(_f$comments),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SpaceListsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpaceListsModel>(map);
  }

  static SpaceListsModel fromJson(String json) {
    return ensureInitialized().decodeJson<SpaceListsModel>(json);
  }
}

mixin SpaceListsModelMappable {
  String toJson() {
    return SpaceListsModelMapper.ensureInitialized()
        .encodeJson<SpaceListsModel>(this as SpaceListsModel);
  }

  Map<String, dynamic> toMap() {
    return SpaceListsModelMapper.ensureInitialized().encodeMap<SpaceListsModel>(
      this as SpaceListsModel,
    );
  }

  SpaceListsModelCopyWith<SpaceListsModel, SpaceListsModel, SpaceListsModel>
  get copyWith =>
      _SpaceListsModelCopyWithImpl<SpaceListsModel, SpaceListsModel>(
        this as SpaceListsModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SpaceListsModelMapper.ensureInitialized().stringifyValue(
      this as SpaceListsModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SpaceListsModelMapper.ensureInitialized().equalsValue(
      this as SpaceListsModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SpaceListsModelMapper.ensureInitialized().hashValue(
      this as SpaceListsModel,
    );
  }
}

extension SpaceListsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpaceListsModel, $Out> {
  SpaceListsModelCopyWith<$R, SpaceListsModel, $Out> get $asSpaceListsModel =>
      $base.as((v, t, t2) => _SpaceListsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SpaceListsModelCopyWith<$R, $In extends SpaceListsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get users;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get comments;
  $R call({
    String? id,
    String? name,
    String? channelName,
    List<Map<String, dynamic>>? users,
    List<Map<String, dynamic>>? comments,
  });
  SpaceListsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SpaceListsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpaceListsModel, $Out>
    implements SpaceListsModelCopyWith<$R, SpaceListsModel, $Out> {
  _SpaceListsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpaceListsModel> $mapper =
      SpaceListsModelMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get users => ListCopyWith(
    $value.users,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(users: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get comments => ListCopyWith(
    $value.comments,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(comments: v),
  );
  @override
  $R call({
    String? id,
    String? name,
    String? channelName,
    List<Map<String, dynamic>>? users,
    List<Map<String, dynamic>>? comments,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (channelName != null) #channelName: channelName,
      if (users != null) #users: users,
      if (comments != null) #comments: comments,
    }),
  );
  @override
  SpaceListsModel $make(CopyWithData data) => SpaceListsModel(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    channelName: data.get(#channelName, or: $value.channelName),
    users: data.get(#users, or: $value.users),
    comments: data.get(#comments, or: $value.comments),
  );

  @override
  SpaceListsModelCopyWith<$R2, SpaceListsModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SpaceListsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
