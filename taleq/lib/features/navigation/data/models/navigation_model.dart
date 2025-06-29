import 'package:taleq/features/navigation/domain/entities/navigation.dart';

class NavigationModel {
  final String id;
  final String name;

  NavigationModel({
    required this.id,
    required this.name,
  });

  factory NavigationModel.fromJson(Map<String, dynamic> json) {
    return NavigationModel(
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

  Navigation toEntity() {
    return Navigation(
      id: id,
      name: name,
    );
  }
}
