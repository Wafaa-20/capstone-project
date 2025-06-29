import 'package:equatable/equatable.dart';

class Camera_analysis extends Equatable {
  final String id;
  final String name;

  const Camera_analysis({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
