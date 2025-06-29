import 'package:equatable/equatable.dart';

class Exercises extends Equatable {
  final String id;
  final String name;

  const Exercises({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
