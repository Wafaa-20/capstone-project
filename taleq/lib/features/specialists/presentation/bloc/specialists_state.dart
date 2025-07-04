import 'package:equatable/equatable.dart';
import 'package:taleq/features/specialists/domain/entities/specialist_entities.dart';

sealed class SpecialistsState extends Equatable {
  const SpecialistsState();

  @override
  List<Object> get props => [];
}

final class SpecialistsInitial extends SpecialistsState {}

final class SpecialistsLoading extends SpecialistsState {}

final class SpecialistsSuccesses extends SpecialistsState {
  final List<SpecialistEntities> specialists;

  const SpecialistsSuccesses({required this.specialists});
  @override
  List<Object> get props => [specialists];
}

final class SpecialistsFailure extends SpecialistsState {
  final String message;

  const SpecialistsFailure({required this.message});
}
