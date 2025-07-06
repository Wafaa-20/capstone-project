import 'package:taleq/features/space/domain/entities/space.dart';
import 'package:dart_mappable/dart_mappable.dart';

@MappableClass()
class SpaceListsModel {
  final String id;
  final String name;
  final String channelName;
  final List<Map<String, dynamic>> users;
  final List<Map<String, dynamic>> comments;

  SpaceListsModel({
    required this.id,
    required this.name,
    required this.channelName,
    required this.users,
    required this.comments,
  });
}

extension SpaceEntityToEntityMapper on SpaceListsModel {
  SpaceEntity toEntity() {
    return SpaceEntity(
      id: id,
      name: name,
      channelName: channelName,
      users: users,
      comments: comments,
    );
  }
}
