import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetSpecialistData extends HomeEvent {
  const GetSpecialistData();
}

class InsertStory extends HomeEvent {
  final String title;
  final String text;
  const InsertStory({required this.title, required this.text});
}

class GoLiveEvent extends HomeEvent {
  final String uid;
  const GoLiveEvent({required this.uid});
}
