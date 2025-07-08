import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/domain/entities/specialist_entity.dart';

@MappableClass()
class SpecialistModel {
  final String id;
  final String image;

  SpecialistModel({required this.id, required this.image});
}

extension SpecialistModelToEntityMapper on SpecialistModel {
  SpecialistEntity toEntity() {
    return SpecialistEntity(id: id, image: image);
  }
}
