import 'package:taleq/features/lives/domain/entities/lives.dart';

class LivesModel {
  final String id;
  final String name;

  LivesModel({
    required this.id,
    required this.name,
  });

  factory LivesModel.fromJson(Map<String, dynamic> json) {
    return LivesModel(
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

  Lives toEntity() {
    return Lives(
      id: id,
      name: name,
    );
  }
}
