import 'package:equatable/equatable.dart';

class ResendOTPEntity extends Equatable {
  final String email;

  const ResendOTPEntity({required this.email});

  @override
  List<Object> get props => [email];
}
