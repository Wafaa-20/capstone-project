import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/groups/domain/entities/space_details.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';

class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object> get props => [];
}

class GroupsInitial extends GroupsState {
  const GroupsInitial();
}

class GetSuccees extends GroupsState {
  final List<SpacesEntity>? userSpaces;
  final List<SpacesEntity>? availableSpaces;
  const GetSuccees({required this.userSpaces, required this.availableSpaces});
}

class GetFalid extends GroupsState {
  final String message;
  const GetFalid({required this.message});
}

class SpacesLoading extends GroupsState {
  const SpacesLoading();
}

class SpaceDetailsSuccess extends GroupsState {
  final SpaceDetailsEntity spaceDetails;
  const SpaceDetailsSuccess({required this.spaceDetails});
}

class SpaceDetailsFiled extends GroupsState {
  const SpaceDetailsFiled();
}

class JoinSuccees extends GroupsState {
  final String userID;
  final String token;
  final String hostID;
  const JoinSuccees({
    required this.userID,
    required this.token,
    required this.hostID,
  });
}

class JoinFalid extends GroupsState {
  final String message;
  const JoinFalid({required this.message});
}
