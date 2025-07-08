import 'package:equatable/equatable.dart';
import 'package:taleq/features/home/domain/entities/specialist_entity.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class GetFailure extends HomeState {
  final String message;
  const GetFailure({required this.message});
}

class GetSuccess extends HomeState {
  final List<SpecialistEntity> specialistList;
  const GetSuccess({required this.specialistList});
}
