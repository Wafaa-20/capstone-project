import 'package:equatable/equatable.dart';

class SpaceEntity extends Equatable {
  final String id;
  final String name;
  final String channelName;
  final String hostID;
  final List<Map<String, dynamic>> users;
  final List<Map<String, dynamic>> comments;

  const SpaceEntity({
    required this.id,
    required this.name,
    required this.channelName,
    required this.hostID,
    required this.users,
    required this.comments,
  });
  SpaceEntity copyWith({
    String? id,
    String? name,
    final String? channelName,
    final String? hostID,
    final List<Map<String, dynamic>>? users,
    final List<Map<String, dynamic>>? comments,
  }) {
    return SpaceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      channelName: channelName ?? this.channelName,
      hostID: hostID ?? this.hostID,
      users: users ?? this.users,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object> get props => [id, name, channelName, users, comments];
}
