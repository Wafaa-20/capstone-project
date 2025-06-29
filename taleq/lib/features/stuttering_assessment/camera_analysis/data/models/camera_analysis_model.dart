import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/entities/camera_analysis.dart';

class Camera_analysisModel {
  final String id;
  final String name;

  Camera_analysisModel({
    required this.id,
    required this.name,
  });

  factory Camera_analysisModel.fromJson(Map<String, dynamic> json) {
    return Camera_analysisModel(
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

  Camera_analysis toEntity() {
    return Camera_analysis(
      id: id,
      name: name,
    );
  }
}
