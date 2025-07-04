import 'package:taleq/features/space/domain/entities/space.dart';

class SpaceModel {
  final String id;
  final String name;

  SpaceModel({
    required this.id,
    required this.name,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
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

  Space toEntity() {
    return Space(
      id: id,
      name: name,
    );
  }
}
