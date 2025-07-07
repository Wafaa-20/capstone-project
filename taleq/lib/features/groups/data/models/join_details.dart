import 'dart:collection';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/groups/domain/entities/join_details.dart';

@MappableClass()
class JoinDetailsModel {
  final String userID;
  final String token;
  final String hostID;

  const JoinDetailsModel({
    required this.hostID,
    required this.userID,
    required this.token,
  });
}

extension JoinDetailsEntityToEntityMapper on JoinDetailsModel {
  JoinDetailsEntity toEntity() {
    return JoinDetailsEntity(userID: userID, token: token,hostID:hostID);
  }
}
