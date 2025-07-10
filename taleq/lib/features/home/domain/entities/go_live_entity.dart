import 'package:equatable/equatable.dart';

class GoLiveEntity extends Equatable {
  final String userAccount;
  final int intUserAccount;
  final String token;
  final String channelName;
  final String hostID;
  const GoLiveEntity({
    required this.intUserAccount,
    required this.userAccount,
    required this.token,
    required this.channelName,
    required this.hostID,
  });

  @override
  List<Object> get props => [intUserAccount, token, channelName, hostID];
}
