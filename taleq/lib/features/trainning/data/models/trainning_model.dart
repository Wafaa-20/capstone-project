import 'package:taleq/features/trainning/domain/entities/trainning.dart';

class TrainningModel {
  final String id;
  final String name;

  TrainningModel({
    required this.id,
    required this.name,
  });

  factory TrainningModel.fromJson(Map<String, dynamic> json) {
    return TrainningModel(
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

  Trainning toEntity() {
    return Trainning(
      id: id,
      name: name,
    );
  }
}
