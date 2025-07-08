

import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/groups/domain/entities/space_details.dart';


@MappableClass()
class SpaceDetails {
  final String id;
  final String name;
  final String channelName;
  final DateTime startDate;
  final DateTime endDate;
  final int numberOfSeats;
  final int numberOfPepole;
  final String description;
  final List<String> goals;

  const SpaceDetails({
    required this.id,
    required this.name,
    required this.channelName,
    required this.startDate,
    required this.endDate,
    required this.numberOfSeats,
    required this.numberOfPepole,
    required this.description,
    required this.goals,
  });
}

extension SpaceDetailsToEntityMapper on SpaceDetails {
  SpaceDetailsEntity toEntity() {
    return SpaceDetailsEntity(
      id: id,
      name: name,
      startDate: startDate,
      endDate: endDate,
      goals: goals,
      numberOfPepole: numberOfPepole,
      numberOfSeats: numberOfSeats,
      channelName: channelName,
      description: description,
    );
  }
}
