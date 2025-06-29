import 'package:taleq/features/plan/domain/entities/plan.dart';

class PlanModel {
  final String id;
  final String name;

  PlanModel({
    required this.id,
    required this.name,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
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

  Plan toEntity() {
    return Plan(
      id: id,
      name: name,
    );
  }
}
