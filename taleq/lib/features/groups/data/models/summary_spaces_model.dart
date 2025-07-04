import 'dart:collection';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';

part 'summary_spaces_model.mapper.dart';

@MappableClass()
class SummarySpace with SummarySpaceMappable {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final UnmodifiableListView<String> avatars;
  final int usersCount;
  final bool isActive;
  final String hostId;

  const SummarySpace({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.avatars,
    required this.usersCount,
    required this.isActive,
    required this.hostId,
  });
}

extension SummarySpaceToEntityMapper on SummarySpace {
  SpacesEntity toEntity() {
    return SpacesEntity(
      id: id,
      title: title,
      startDate: startDate,
      endDate: endDate,
      avatars: avatars,
      usersCount: usersCount,
      isActive: isActive,
      hostId: hostId,
    );
  }
}
