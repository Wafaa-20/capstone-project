import 'package:equatable/equatable.dart';
import 'package:taleq/features/space/domain/entities/space.dart';

sealed class SpaceState extends Equatable {
  const SpaceState();

  @override
  List<Object> get props => [];
}

final class SpaceInitial extends SpaceState {}

class GetSpaceSuccess extends SpaceState {
  final SpaceEntity getSpaceinfo;
  final List<Map<String, dynamic>> getspaceusers;

  const GetSpaceSuccess({required this.getSpaceinfo, required this.getspaceusers});
}

final class GetSpaceFiled extends SpaceState {
  final String message;
  const GetSpaceFiled({required this.message});
}

final class SpaceLoading extends SpaceState {}
