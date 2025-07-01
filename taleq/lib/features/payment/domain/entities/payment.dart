import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String id;
  final String name;

  const Payment({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
