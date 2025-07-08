import 'package:equatable/equatable.dart';

sealed class SpaceEvent extends Equatable {
  const SpaceEvent();

  @override
  List<Object> get props => [];
}

class GetSpaceLists extends SpaceEvent {
  final String spaceID;
  final String userID;
  final String token;
  const GetSpaceLists({
    required this.spaceID,
    required this.userID,
    required this.token,
  });

  @override
  List<Object> get props => [];
}

class UpdateMembersEvent extends SpaceEvent {
  final List<Map<String, dynamic>> members;
  const UpdateMembersEvent(this.members);
}

class UpdateCommentsEvent extends SpaceEvent {
  final Map<String, dynamic> newComment;
  const UpdateCommentsEvent(this.newComment);
}

class AddCommentEvent extends SpaceEvent {
  final String commentText;
  final String spaceID;
  final String userID;
  const AddCommentEvent({
    required this.spaceID,
    required this.userID,
    required this.commentText,
  });
}

class ToggleMicEvent extends SpaceEvent {
  final String userID;
  const ToggleMicEvent({required this.userID});
}

class InitAgoraEvent extends SpaceEvent {
  final String channelName;
  final String token;
  const InitAgoraEvent({required this.channelName, required this.token});
}
class LeaveSpaceEvent extends SpaceEvent {
  final String userID;
  final String spaceID;

  const LeaveSpaceEvent({
    required this.userID,
    required this.spaceID,
  });
}
