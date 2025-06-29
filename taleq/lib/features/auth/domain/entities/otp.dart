import 'package:equatable/equatable.dart';

class OTPEntity extends Equatable {
  final String email;
  final String code;

  const OTPEntity({required this.email, required this.code});

  @override
  List<Object> get props => [email, code];
}
