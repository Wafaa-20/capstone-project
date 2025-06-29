import 'package:equatable/equatable.dart';

class Navigation extends Equatable {
  final String id;
  final String name;

  const Navigation({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
