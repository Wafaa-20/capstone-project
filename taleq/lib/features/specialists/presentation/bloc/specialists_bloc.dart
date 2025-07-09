import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/specialists/domain/entities/specialist_entities.dart';
import 'package:taleq/features/specialists/domain/usecases/get_specialists.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_state.dart';

class SpecialistsBloc extends Bloc<SpecialistsEvent, SpecialistsState> {
  final GetSpecialistsUseCase specialistsUseCase;
  late List<SpecialistEntities> storagedList;
  bool showSearch = false;
  TextEditingController searchController = TextEditingController();
  SpecialistsBloc(this.specialistsUseCase) : super(SpecialistsInitial()) {
    on<LoadSpecialists>(loadSpecialists);
    on<SearchEvent>(search);
    on<ShowSearch>(visableSearch);
  }

  FutureOr<void> visableSearch(
    ShowSearch event,
    Emitter<SpecialistsState> emit,
  ) async {
    showSearch = !showSearch;
    emit(
      SpecialistsSuccesses(specialists: storagedList, showSearch: showSearch),
    );
  }

  FutureOr<void> loadSpecialists(
    LoadSpecialists event,
    Emitter<SpecialistsState> emit,
  ) async {
    emit(SpecialistsLoading());
    final result = await specialistsUseCase(SpecialistsParam());
    result.fold(
      (failure) => emit(SpecialistsFailure(message: failure.message)),
      (success) {
        storagedList = success;
        emit(
          SpecialistsSuccesses(specialists: success, showSearch: showSearch),
        );
      },
    );
  }

  FutureOr<void> search(SearchEvent event, Emitter<SpecialistsState> emit) {
    final query = event.search.toLowerCase();
    final results = storagedList.where((item) {
      final title = item.name.toLowerCase();
      return title.contains(query);
    }).toList();

    emit(SpecialistsSuccesses(specialists: results, showSearch: showSearch));
  }
}
