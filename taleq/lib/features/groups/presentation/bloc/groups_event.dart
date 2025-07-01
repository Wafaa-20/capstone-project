import 'package:equatable/equatable.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object> get props => [];
}

class TitleChanged extends GroupsEvent {
  final String text;

  const TitleChanged(this.text);

  @override
  List<Object> get props => [text];
}
