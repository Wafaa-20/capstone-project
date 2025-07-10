import 'package:equatable/equatable.dart';

sealed class SpecialistsEvent extends Equatable {
  const SpecialistsEvent();

  @override
  List<Object> get props => [];
}

class LoadSpecialists extends SpecialistsEvent {}

class SearchEvent extends SpecialistsEvent {
  final String search;

  const SearchEvent({required this.search});

  @override
  List<Object> get props => [search];
}

class ShowSearch extends SpecialistsEvent {}
