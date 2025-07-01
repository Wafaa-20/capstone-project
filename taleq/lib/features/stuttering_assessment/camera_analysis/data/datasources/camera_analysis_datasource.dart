import 'package:camera/camera.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/data/models/camera_analysis_model.dart';

abstract class CameraAnalysisDatasource {
  Future<CameraAnalysisModel> getCameraAnalysis();
}

class CameraAnalysisDatasourceImpl implements CameraAnalysisDatasource {
  @override
  Future<CameraAnalysisModel> getCameraAnalysis() async {
    try {
      final List<CameraDescription> cameras = await availableCameras();
      final CameraDescription cam = cameras.first;
      return CameraAnalysisModel(
        name: cam.name,
        sensorOrientation: cam.sensorOrientation,
      );
    } on CameraException catch (e) {
      throw FormatException(e.toString());
    } catch (e) {
      throw FormatException("There is error with save answer");
    }
  }
}
