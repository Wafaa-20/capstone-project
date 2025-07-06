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

// تحديث الأعضاء (قائمة الأعضاء الجديدة كاملة)
class UpdateMembersEvent extends SpaceEvent {
  final List<Map<String, dynamic>> members;
  const UpdateMembersEvent(this.members);
}

// إضافة تعليق جديد (تعليق واحد فقط)
class UpdateCommentsEvent extends SpaceEvent {
  final Map<String, dynamic> newComment;
  const UpdateCommentsEvent(this.newComment);
}

class AddCommentEvent extends SpaceEvent {
  final String commentText;
  const AddCommentEvent({required this.commentText});
}
