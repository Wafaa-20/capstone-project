// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter
import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/groups/data/models/space_details_model.dart';

class SpaceDetailsMapper extends ClassMapperBase<SpaceDetails> {
  SpaceDetailsMapper._();

  static SpaceDetailsMapper? _instance;
  static SpaceDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpaceDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SpaceDetails';

  static String _$id(SpaceDetails v) => v.id;
  static const Field<SpaceDetails, String> _f$id = Field('id', _$id);
  static String _$name(SpaceDetails v) => v.name;
  static const Field<SpaceDetails, String> _f$name = Field('name', _$name);
  static String _$channelName(SpaceDetails v) => v.channelName;
  static const Field<SpaceDetails, String> _f$channelName = Field(
    'channelName',
    _$channelName,
  );
  static DateTime _$startDate(SpaceDetails v) => v.startDate;
  static const Field<SpaceDetails, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
  );
  static DateTime _$endDate(SpaceDetails v) => v.endDate;
  static const Field<SpaceDetails, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
  );
  static int _$numberOfSeats(SpaceDetails v) => v.numberOfSeats;
  static const Field<SpaceDetails, int> _f$numberOfSeats = Field(
    'numberOfSeats',
    _$numberOfSeats,
  );
  static int _$numberOfPepole(SpaceDetails v) => v.numberOfPepole;
  static const Field<SpaceDetails, int> _f$numberOfPepole = Field(
    'numberOfPepole',
    _$numberOfPepole,
  );
  static String _$description(SpaceDetails v) => v.description;
  static const Field<SpaceDetails, String> _f$description = Field(
    'description',
    _$description,
  );
  static List<String> _$goals(SpaceDetails v) => v.goals;
  static const Field<SpaceDetails, List<String>> _f$goals = Field(
    'goals',
    _$goals,
  );

  @override
  final MappableFields<SpaceDetails> fields = const {
    #id: _f$id,
    #name: _f$name,
    #channelName: _f$channelName,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #numberOfSeats: _f$numberOfSeats,
    #numberOfPepole: _f$numberOfPepole,
    #description: _f$description,
    #goals: _f$goals,
  };

  static SpaceDetails _instantiate(DecodingData data) {
    return SpaceDetails(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      channelName: data.dec(_f$channelName),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
      numberOfSeats: data.dec(_f$numberOfSeats),
      numberOfPepole: data.dec(_f$numberOfPepole),
      description: data.dec(_f$description),
      goals: data.dec(_f$goals),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SpaceDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpaceDetails>(map);
  }

  static SpaceDetails fromJson(String json) {
    return ensureInitialized().decodeJson<SpaceDetails>(json);
  }
}

mixin SpaceDetailsMappable {
  String toJson() {
    return SpaceDetailsMapper.ensureInitialized().encodeJson<SpaceDetails>(
      this as SpaceDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return SpaceDetailsMapper.ensureInitialized().encodeMap<SpaceDetails>(
      this as SpaceDetails,
    );
  }

  SpaceDetailsCopyWith<SpaceDetails, SpaceDetails, SpaceDetails> get copyWith =>
      _SpaceDetailsCopyWithImpl<SpaceDetails, SpaceDetails>(
        this as SpaceDetails,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SpaceDetailsMapper.ensureInitialized().stringifyValue(
      this as SpaceDetails,
    );
  }

  @override
  bool operator ==(Object other) {
    return SpaceDetailsMapper.ensureInitialized().equalsValue(
      this as SpaceDetails,
      other,
    );
  }

  @override
  int get hashCode {
    return SpaceDetailsMapper.ensureInitialized().hashValue(
      this as SpaceDetails,
    );
  }
}

extension SpaceDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpaceDetails, $Out> {
  SpaceDetailsCopyWith<$R, SpaceDetails, $Out> get $asSpaceDetails =>
      $base.as((v, t, t2) => _SpaceDetailsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SpaceDetailsCopyWith<$R, $In extends SpaceDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get goals;
  $R call({
    String? id,
    String? name,
    String? channelName,
    DateTime? startDate,
    DateTime? endDate,
    int? numberOfSeats,
    int? numberOfPepole,
    String? description,
    List<String>? goals,
  });
  SpaceDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SpaceDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpaceDetails, $Out>
    implements SpaceDetailsCopyWith<$R, SpaceDetails, $Out> {
  _SpaceDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpaceDetails> $mapper =
      SpaceDetailsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get goals =>
      ListCopyWith(
        $value.goals,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(goals: v),
      );
  @override
  $R call({
    String? id,
    String? name,
    String? channelName,
    DateTime? startDate,
    DateTime? endDate,
    int? numberOfSeats,
    int? numberOfPepole,
    String? description,
    List<String>? goals,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (channelName != null) #channelName: channelName,
      if (startDate != null) #startDate: startDate,
      if (endDate != null) #endDate: endDate,
      if (numberOfSeats != null) #numberOfSeats: numberOfSeats,
      if (numberOfPepole != null) #numberOfPepole: numberOfPepole,
      if (description != null) #description: description,
      if (goals != null) #goals: goals,
    }),
  );
  @override
  SpaceDetails $make(CopyWithData data) => SpaceDetails(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    channelName: data.get(#channelName, or: $value.channelName),
    startDate: data.get(#startDate, or: $value.startDate),
    endDate: data.get(#endDate, or: $value.endDate),
    numberOfSeats: data.get(#numberOfSeats, or: $value.numberOfSeats),
    numberOfPepole: data.get(#numberOfPepole, or: $value.numberOfPepole),
    description: data.get(#description, or: $value.description),
    goals: data.get(#goals, or: $value.goals),
  );

  @override
  SpaceDetailsCopyWith<$R2, SpaceDetails, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SpaceDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
