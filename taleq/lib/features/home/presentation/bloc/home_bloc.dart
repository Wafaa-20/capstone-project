import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/home/domain/usecases/insert_story_use_case.dart';
import 'package:taleq/features/home/domain/usecases/specialist_use_case.dart';
import 'package:taleq/features/home/presentation/bloc/home_event.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SpecialistUseCase _dateOfSpecialistUseCase;
  final InsertStoryUseCase _insertStorageUseCase;
  final titleController = TextEditingController();
  final storyController = TextEditingController();

  HomeBloc(this._dateOfSpecialistUseCase, this._insertStorageUseCase)
    : super(HomeInitial()) {
    on<GetSpecialistData>(getData);
    on<InsertStory>(insertStory);
  }

  FutureOr<void> getData(event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    final result = await _dateOfSpecialistUseCase();
    result.fold(
      (failure) => emit(GetFailure(message: failure.message)),
      (success) => emit(GetSuccess(homeList: success)),
    );
  }

  FutureOr<void> insertStory(InsertStory event, Emitter<HomeState> emit) async {
    final result = await _insertStorageUseCase(
      InsertStoryParams(title: event.title, story: event.text),
    );
    result.fold(
      (failure) => emit(GetFailure(message: failure.message)),
      (success) {emit(SendSuccess());},
    );
  }
}
