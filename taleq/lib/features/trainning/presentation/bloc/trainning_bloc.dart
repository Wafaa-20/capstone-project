import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/trainning/presentation/bloc/trainning_event.dart';
import 'package:taleq/features/trainning/presentation/bloc/trainning_state.dart';

class TrainningBloc extends Bloc<TrainningEvent, TrainningState> {
  TrainningBloc() : super(TrainningInitial()) {
    on<TrainningEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
