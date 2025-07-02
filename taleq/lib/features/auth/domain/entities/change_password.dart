import 'package:equatable/equatable.dart';

class ChangePasswordEntity extends Equatable {
  final String email;
  final String password;

  const ChangePasswordEntity({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
