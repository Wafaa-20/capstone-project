import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/specialists/domain/entities/specialist_entities.dart';

part 'specialists_model.mapper.dart';

@MappableClass()
class SpecialistsModel extends SpecialistEntities
    with SpecialistsModelMappable {
  const SpecialistsModel({
    required super.id,
    required super.image,
    required super.name,
    required super.subtitle,
    required super.rating,
    required super.description,
  });
}
