import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/specialist_model.mapper.dart';

import 'package:taleq/features/home/domain/entities/home_entity.dart';

@MappableClass()
class SpecialistModel with SpecialistModelMappable   {
  final String id;
  final String image;

  SpecialistModel({required this.id, required this.image});

}


