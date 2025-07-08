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
  final bool isMicEnabled;
  final bool isAgoraInitialized;
  const GetSpaceSuccess({
    required this.getSpaceinfo,
    required this.getspaceusers,
    required this.isMicEnabled,
    required this.isAgoraInitialized,
  });
  @override
  List<Object> get props => [
    getSpaceinfo,
    getspaceusers,
    isMicEnabled,
    isAgoraInitialized,
  ];
  GetSpaceSuccess copyWith({
    SpaceEntity? getSpaceinfo,
    List<Map<String, dynamic>>? getspaceusers,
    bool? isMicEnabled,
    bool? isAgoraInitialized,
  }) {
    return GetSpaceSuccess(
      getSpaceinfo: getSpaceinfo ?? this.getSpaceinfo,
      getspaceusers: getspaceusers ?? this.getspaceusers,
      isMicEnabled: isMicEnabled ?? this.isMicEnabled,
      isAgoraInitialized: isAgoraInitialized ?? this.isAgoraInitialized,
    );
  }
}

final class GetSpaceFiled extends SpaceState {
  final String message;
  const GetSpaceFiled({required this.message});
}

final class SpaceLoading extends SpaceState {}
