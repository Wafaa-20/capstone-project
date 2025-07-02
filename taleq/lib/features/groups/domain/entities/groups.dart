import 'package:equatable/equatable.dart';

class Groups extends Equatable {
  final String id;
  final String name;

  const Groups({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
