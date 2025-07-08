import 'package:equatable/equatable.dart';

class SpecialistEntity extends Equatable {
  final String id;
  final String image;

  const SpecialistEntity({required this.id, required this.image});

  @override
  List<Object> get props => [id, image];
}
