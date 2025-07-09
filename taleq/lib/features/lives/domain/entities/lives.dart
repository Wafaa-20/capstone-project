import 'package:equatable/equatable.dart';

class Lives extends Equatable {
  final String id;
  final String name;

  const Lives({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
