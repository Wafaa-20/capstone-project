import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  SpaceBloc() : super(SpaceInitial()) {
    on<SpaceEvent>((event, emit) {});
  }
}
