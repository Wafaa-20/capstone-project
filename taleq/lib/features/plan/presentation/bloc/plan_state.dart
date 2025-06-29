import 'package:equatable/equatable.dart';

sealed class PlanState extends Equatable {
  const PlanState();

  @override
  List<Object> get props => [];
}

final class PlanInitial extends PlanState {}
