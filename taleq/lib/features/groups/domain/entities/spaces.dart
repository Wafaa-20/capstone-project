import 'dart:collection';

import 'package:equatable/equatable.dart';

class SpacesEntity extends Equatable {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final UnmodifiableListView<String> avatars;
  final int usersCount;
  final bool isActive;
  final String hostId;

  const SpacesEntity({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.avatars,
    required this.usersCount,
    required this.isActive,
    required this.hostId,
  });

  @override
  List<Object> get props => [
    id,
    title,
    startDate,
    endDate,
    avatars,
    usersCount,
    isActive,
    hostId,
  ];
}
