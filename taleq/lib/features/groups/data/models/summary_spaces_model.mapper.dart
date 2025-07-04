// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'summary_spaces_model.dart';

class SummarySpaceMapper extends ClassMapperBase<SummarySpace> {
  
  SummarySpaceMapper._();

  static SummarySpaceMapper? _instance;
  static SummarySpaceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SummarySpaceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SummarySpace';

  static String _$id(SummarySpace v) => v.id;
  static const Field<SummarySpace, String> _f$id = Field('id', _$id);
  static String _$title(SummarySpace v) => v.title;
  static const Field<SummarySpace, String> _f$title = Field('title', _$title);
  static DateTime _$startDate(SummarySpace v) => v.startDate;
  static const Field<SummarySpace, DateTime> _f$startDate =
      Field('startDate', _$startDate);
  static DateTime _$endDate(SummarySpace v) => v.endDate;
  static const Field<SummarySpace, DateTime> _f$endDate =
      Field('endDate', _$endDate);
  static UnmodifiableListView<String> _$avatars(SummarySpace v) => v.avatars;
  static const Field<SummarySpace, UnmodifiableListView<String>> _f$avatars =
      Field('avatars', _$avatars);
  static int _$usersCount(SummarySpace v) => v.usersCount;
  static const Field<SummarySpace, int> _f$usersCount =
      Field('usersCount', _$usersCount);
  static bool _$isActive(SummarySpace v) => v.isActive;
  static const Field<SummarySpace, bool> _f$isActive =
      Field('isActive', _$isActive);
  static String _$hostId(SummarySpace v) => v.hostId;
  static const Field<SummarySpace, String> _f$hostId =
      Field('hostId', _$hostId);

  @override
  final MappableFields<SummarySpace> fields = const {
    #id: _f$id,
    #title: _f$title,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #avatars: _f$avatars,
    #usersCount: _f$usersCount,
    #isActive: _f$isActive,
    #hostId: _f$hostId,
  };

  static SummarySpace _instantiate(DecodingData data) {
    return SummarySpace(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        avatars: data.dec(_f$avatars),
        usersCount: data.dec(_f$usersCount),
        isActive: data.dec(_f$isActive),
        hostId: data.dec(_f$hostId));
  }

  @override
  final Function instantiate = _instantiate;

  static SummarySpace fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SummarySpace>(map);
  }

  static SummarySpace fromJson(String json) {
    return ensureInitialized().decodeJson<SummarySpace>(json);
  }
}

mixin SummarySpaceMappable {
  String toJson() {
    return SummarySpaceMapper.ensureInitialized()
        .encodeJson<SummarySpace>(this as SummarySpace);
  }

  Map<String, dynamic> toMap() {
    return SummarySpaceMapper.ensureInitialized()
        .encodeMap<SummarySpace>(this as SummarySpace);
  }

  SummarySpaceCopyWith<SummarySpace, SummarySpace, SummarySpace> get copyWith =>
      _SummarySpaceCopyWithImpl<SummarySpace, SummarySpace>(
          this as SummarySpace, $identity, $identity);
  @override
  String toString() {
    return SummarySpaceMapper.ensureInitialized()
        .stringifyValue(this as SummarySpace);
  }

  @override
  bool operator ==(Object other) {
    return SummarySpaceMapper.ensureInitialized()
        .equalsValue(this as SummarySpace, other);
  }

  @override
  int get hashCode {
    return SummarySpaceMapper.ensureInitialized()
        .hashValue(this as SummarySpace);
  }
}

extension SummarySpaceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SummarySpace, $Out> {
  SummarySpaceCopyWith<$R, SummarySpace, $Out> get $asSummarySpace =>
      $base.as((v, t, t2) => _SummarySpaceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SummarySpaceCopyWith<$R, $In extends SummarySpace, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? title,
      DateTime? startDate,
      DateTime? endDate,
      UnmodifiableListView<String>? avatars,
      int? usersCount,
      bool? isActive,
      String? hostId});
  SummarySpaceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SummarySpaceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SummarySpace, $Out>
    implements SummarySpaceCopyWith<$R, SummarySpace, $Out> {
  _SummarySpaceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SummarySpace> $mapper =
      SummarySpaceMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? title,
          DateTime? startDate,
          DateTime? endDate,
          UnmodifiableListView<String>? avatars,
          int? usersCount,
          bool? isActive,
          String? hostId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (startDate != null) #startDate: startDate,
        if (endDate != null) #endDate: endDate,
        if (avatars != null) #avatars: avatars,
        if (usersCount != null) #usersCount: usersCount,
        if (isActive != null) #isActive: isActive,
        if (hostId != null) #hostId: hostId
      }));
  @override
  SummarySpace $make(CopyWithData data) => SummarySpace(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      avatars: data.get(#avatars, or: $value.avatars),
      usersCount: data.get(#usersCount, or: $value.usersCount),
      isActive: data.get(#isActive, or: $value.isActive),
      hostId: data.get(#hostId, or: $value.hostId));

  @override
  SummarySpaceCopyWith<$R2, SummarySpace, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SummarySpaceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
