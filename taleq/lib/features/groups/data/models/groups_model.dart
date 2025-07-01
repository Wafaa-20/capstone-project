import 'package:taleq/features/groups/domain/entities/groups.dart';

class GroupsModel {
  final String id;
  final String name;

  GroupsModel({
    required this.id,
    required this.name,
  });

  factory GroupsModel.fromJson(Map<String, dynamic> json) {
    return GroupsModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Groups toEntity() {
    return Groups(
      id: id,
      name: name,
    );
  }
}
