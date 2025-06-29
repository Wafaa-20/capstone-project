import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_event.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_state.dart';

class Camera_analysisBloc extends Bloc<Camera_analysisEvent, Camera_analysisState> {
  Camera_analysisBloc() : super(Camera_analysisInitial()) {
    on<Camera_analysisEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
