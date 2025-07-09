import 'package:equatable/equatable.dart';
import 'package:camera/camera.dart';

abstract class CameraAnalysisState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// لم يبدأ شيء بعد
class CameraInitial extends CameraAnalysisState {}

/// الكاميرا جاهزة
class CameraReady extends CameraAnalysisState {
  final CameraController controller;
  CameraReady(this.controller);

  @override
  List<Object?> get props => [controller];
}

/// التسجيل جاري
class RecordingInProgress extends CameraAnalysisState {}

/// انتهاء التسجيل والفيديو جاهز للإرسال
class RecordingCompleted extends CameraAnalysisState {
  final XFile videoFile;
  RecordingCompleted(this.videoFile);

  @override
  List<Object?> get props => [videoFile];
}

/// جاري إرسال الفيديو
class UploadInProgress extends CameraAnalysisState {}

/// إرسال ناجح
class UploadSuccess extends CameraAnalysisState {}

/// حدوث خطأ
class UploadFailure extends CameraAnalysisState {
  final String error;
  UploadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
