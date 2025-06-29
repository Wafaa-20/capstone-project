import 'package:equatable/equatable.dart';

class Plan extends Equatable {
  final String id;
  final String name;

  const Plan({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
