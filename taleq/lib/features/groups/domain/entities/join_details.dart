import 'dart:collection';
import 'package:equatable/equatable.dart';

class JoinDetailsEntity extends Equatable {
  final String userID;
  final String token;

  const JoinDetailsEntity({required this.userID, required this.token});

  @override
  List<Object> get props => [userID, token];
}
