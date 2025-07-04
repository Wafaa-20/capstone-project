import 'package:equatable/equatable.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object> get props => [];
}

class GetSpaces extends GroupsEvent {
  const GetSpaces();
}

class TitleChanged extends GroupsEvent {
  final String text;

  const TitleChanged(this.text);

  @override
  List<Object> get props => [text];
}

class BringSpaceDetails extends GroupsEvent {
  final String spaceId;

  const BringSpaceDetails({required this.spaceId});

  @override
  List<Object> get props => [spaceId];
}
