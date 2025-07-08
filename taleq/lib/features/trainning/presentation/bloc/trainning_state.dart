import 'package:equatable/equatable.dart';

sealed class TrainningState extends Equatable {
  const TrainningState();

  @override
  List<Object> get props => [];
}

final class TrainningInitial extends TrainningState {}
