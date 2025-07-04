import 'package:equatable/equatable.dart';

class SpecialistEntities extends Equatable {
  final int id;
  final String image;
  final String name;
  final String subtitle;
  final double rating;
  final List<String> description;

  const SpecialistEntities({
    required this.id,
    required this.image,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.description,
  });

  @override
  List<Object> get props => [id, image, name, subtitle, rating, description];
}
