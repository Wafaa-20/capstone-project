import 'package:equatable/equatable.dart';

/// --------- States ---------
abstract class AudioState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// الحالة الابتدائية قبل أي تسجيل
class AudioInitial extends AudioState {}

/// حالة أثناء التسجيل
class AudioRecording extends AudioState {}

/// حالة بعد إيقاف التسجيل
class AudioStopped extends AudioState {}
