import 'package:equatable/equatable.dart';

class Space extends Equatable {
  final String id;
  final String name;

  const Space({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
