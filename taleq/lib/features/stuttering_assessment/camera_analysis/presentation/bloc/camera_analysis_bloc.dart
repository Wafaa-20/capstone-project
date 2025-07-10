import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'camera_analysis_event.dart';
import 'camera_analysis_state.dart';

class CameraAnalysisBloc
    extends Bloc<CameraAnalysisEvent, CameraAnalysisState> {
  CameraController? _controller;

  CameraAnalysisBloc() : super(CameraInitial()) {
    on<InitCamera>(_onInitCamera);
    on<StartVideoRecording>(_onStartRecording);
    on<StopVideoRecording>(_onStopRecording);
    on<UploadVideo>(_onUploadVideo);
  }

  Future<void> _onInitCamera(
      InitCamera event, Emitter<CameraAnalysisState> emit) async {
    emit(CameraInitial());
    final cameras = await availableCameras();
    _controller = CameraController(cameras.first, ResolutionPreset.high);
    await _controller!.initialize();
    emit(CameraReady(_controller!));
  }

  Future<void> _onStartRecording(
      StartVideoRecording event, Emitter<CameraAnalysisState> emit) async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    await _controller!.startVideoRecording();
    emit(RecordingInProgress());
  }

  Future<void> _onStopRecording(
      StopVideoRecording event, Emitter<CameraAnalysisState> emit) async {
    if (_controller == null) return;
    final file = await _controller!.stopVideoRecording();
    emit(RecordingCompleted(file));
  }

  Future<void> _onUploadVideo(
      UploadVideo event, Emitter<CameraAnalysisState> emit) async {
    emit(UploadInProgress());
    try {
      final uri = Uri.parse('http://127.0.0.1:5000/predict');
      final req = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath(
            'video', event.videoFile.path));
      final res = await req.send();
      if (res.statusCode == 200) {
        emit(UploadSuccess());
      } else {
        emit(UploadFailure('Status code: ${res.statusCode}'));
      }
    } catch (e) {
      emit(UploadFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
