

import 'package:equatable/equatable.dart';

class SpaceDetailsEntity extends Equatable {
  final String id;
  final String name;
  final String channelName;
  final DateTime startDate;
  final DateTime endDate;
  final int numberOfSeats;
  final int numberOfPepole;
  final String description;
  final List<String> goals;

  const SpaceDetailsEntity({
    required this.id,
    required this.name,
    required this.channelName,
    required this.numberOfSeats,
    required this.numberOfPepole,
    required this.description,
    required this.goals,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object> get props => [
    id,
    name,
    channelName,
    numberOfSeats,
    numberOfPepole,
    startDate,
    endDate,
    description,
    goals,
    
  ];
}
