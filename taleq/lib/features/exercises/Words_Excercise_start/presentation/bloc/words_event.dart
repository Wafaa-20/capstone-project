import 'package:equatable/equatable.dart';

/// --------- Events ---------
abstract class AudioEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// حدث لبدء التسجيل
class StartRecording extends AudioEvent {}

/// حدث لإيقاف التسجيل
class StopRecording extends AudioEvent {}
