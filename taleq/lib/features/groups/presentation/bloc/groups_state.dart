import 'package:equatable/equatable.dart';

class GroupsState extends Equatable {
  final bool showButton;

  const GroupsState({required this.showButton});

  @override
  List<Object> get props => [showButton];
}

class GroupsInitial extends GroupsState {
  const GroupsInitial({required super.showButton});
}
