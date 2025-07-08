import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/home/domain/usecases/specialist_use_case.dart';
import 'package:taleq/features/home/presentation/bloc/home_event.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SpecialistUseCase _dateOfSpecialistUseCase;

  HomeBloc(this._dateOfSpecialistUseCase) : super(HomeInitial()) {
    on<GetSpecialistData>(getData);
  }

  FutureOr<void> getData(event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final result = await _dateOfSpecialistUseCase();
    result.fold(
      (failure) => emit(GetFailure(message: failure.message)),
      (success) => emit(GetSuccess(specialistList: success)),
    );
  }
}
