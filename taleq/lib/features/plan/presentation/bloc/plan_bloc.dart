import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_event.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanInitial()) {
    on<PlanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
