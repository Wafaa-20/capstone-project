import 'dart:collection';
import 'package:equatable/equatable.dart';

class JoinDetailsEntity extends Equatable {
  final String userID;
  final String token;
  final String hostID;

  const JoinDetailsEntity({
    required this.userID,
    required this.token,
    required this.hostID,
  });

  @override
  List<Object> get props => [userID, token, hostID];
}
