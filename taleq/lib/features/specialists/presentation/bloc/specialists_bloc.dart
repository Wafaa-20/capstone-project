import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/specialists/domain/usecases/get_specialists.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_state.dart';

class SpecialistsBloc extends Bloc<SpecialistsEvent, SpecialistsState> {
  final GetSpecialistsUseCase specialistsUseCase;
  SpecialistsBloc(this.specialistsUseCase) : super(SpecialistsInitial()) {
    on<SpecialistsEvent>((event, emit) {});
    on<LoadSpecialists>(loadSpecialists);
  }

  FutureOr<void> loadSpecialists(
    LoadSpecialists event,
    Emitter<SpecialistsState> emit,
  ) async {
    emit(SpecialistsLoading());
    final result = await specialistsUseCase(SpecialistsParam());
    print("Result From BLOC: $result");
    result.fold(
      (failure) => emit(SpecialistsFailure(message: failure.message)),
      (success) => emit(SpecialistsSuccesses(specialists: success)),
    );
  }
}
