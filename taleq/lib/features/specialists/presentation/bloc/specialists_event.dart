import 'package:equatable/equatable.dart';

sealed class SpecialistsEvent extends Equatable {
  const SpecialistsEvent();

  @override
  List<Object> get props => [];
}

class LoadSpecialists extends SpecialistsEvent {}