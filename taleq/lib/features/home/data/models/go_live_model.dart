import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/domain/entities/go_live_entity.dart';

@MappableClass()
class GoLiveModel {
  final String userAccount;
  final int intUserAccount;
  final String token;
  final String channelName;
  final String hostID;

  GoLiveModel({
    required this.intUserAccount,
    required this.userAccount,
    required this.token,
    required this.channelName,
    required this.hostID,
  });
}

extension GoLiveModelToEntityMapper on GoLiveModel {
  GoLiveEntity toEntity() {
    return GoLiveEntity(
      userAccount: userAccount,
      token: token,
      channelName: channelName,
      hostID: hostID,
      intUserAccount: intUserAccount,
    );
  }
}
