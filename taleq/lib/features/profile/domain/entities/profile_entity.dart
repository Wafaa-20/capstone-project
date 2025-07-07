import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String fullName;
  final String email;
  final String? password;
  final String? avatarUrl;

  const ProfileEntity({
    required this.fullName,
    required this.email,
     this.password,
    this.avatarUrl,
  });

  @override
  List<Object> get props => [fullName, email, password!, avatarUrl!];
}
