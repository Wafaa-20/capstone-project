import 'package:equatable/equatable.dart';
import 'package:camera/camera.dart';

abstract class CameraAnalysisEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ابدأ تهيئة الكاميرا
class InitCamera extends CameraAnalysisEvent {}

/// ابدأ التسجيل
class StartVideoRecording extends CameraAnalysisEvent {}

/// أوقف التسجيل
class StopVideoRecording extends CameraAnalysisEvent {}

/// أرسل الفيديو بعد الانتهاء
class UploadVideo extends CameraAnalysisEvent {
  final XFile videoFile;
  UploadVideo(this.videoFile);

  @override
  List<Object?> get props => [videoFile];
}
