import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/features/groups/domain/usecases/get_space_details_use_case.dart';
import 'package:taleq/features/groups/domain/usecases/get_spaces_use_case.dart';
import 'package:taleq/features/groups/domain/usecases/join_space_use_case.dart';
import 'groups_event.dart';
import 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final title = TextEditingController();
  final details = TextEditingController();
  final GetSpacesUseCase _getSpacesUseCase;
  final GetSpaceDetailsUseCase _getSpaceDetailsUseCase;
  final JoinSpaceUseCase _joinSpaceUseCase;
  GroupsBloc(this._getSpacesUseCase, this._getSpaceDetailsUseCase, this._joinSpaceUseCase)
    : super(GroupsInitial()) {
    on<GetSpaces>(getSpaces);
    on<BringSpaceDetails>(getSpaceDetails);
    on<JoinSpace>(joinspace);
  }
  FutureOr<void> getSpaces(event, Emitter<GroupsState> emit) async {
    emit(SpacesLoading());
    final spaces = await _getSpacesUseCase(GetSpacesParams());

    spaces.fold(
      (failure) => emit(GetFalid(message: failure.message)),
      (spaces) => emit(
        GetSuccees(
          userSpaces: spaces["userSpaces"],
          availableSpaces: spaces["availableSpaces"],
        ),
      ),
    );
  }

    FutureOr<void> joinspace(JoinSpace event, Emitter<GroupsState> emit) async {
    emit(SpacesLoading());
    final result = await _joinSpaceUseCase(JoinSpaceParams(spaceID: event.spaceID,channelName:event.channelName));

    result.fold(
      (failure) => emit(JoinFalid(message: failure.message)),
      (result) => emit(JoinSuccees(userID: result.userID, token: result.token)),
    );
  }

  FutureOr<void> getSpaceDetails(
    BringSpaceDetails event,
    Emitter<GroupsState> emit,
  ) async {
    emit(SpacesLoading());
    final spaceDetails = await _getSpaceDetailsUseCase(
      GetSpaceDetailsParams(id: event.spaceId),
    );

    spaceDetails.fold(
      (failure) => emit(SpaceDetailsFiled()),
      (space) => emit(SpaceDetailsSuccess(spaceDetails: space)),
    );
  }

  String formatDate(DateTime startDate, DateTime endDate) {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final start = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    if (isTodayBetween(todayDate, start, end)) {
      return "${AppText.today.tr()} / ${today.month} / ${today.year}";
    }

    if (todayDate.isBefore(start)) {
      return "${today.day} / ${today.month} / ${today.year}";
    }

    if (todayDate.isAfter(end)) {
      return "مغلقة";
    }

    return DateFormat('yyyy-MM-dd').format(today);
  }

  String formatDetailsDate(DateTime startDate, DateTime endDate) {
    final monthName = DateFormat.MMMM('ar').format(startDate);

    return "${startDate.day}-${endDate.day} $monthName";
  }

  bool isTodayBetween(DateTime today, DateTime start, DateTime end) {
    return (today.isAtSameMomentAs(start) || today.isAfter(start)) &&
        (today.isAtSameMomentAs(end) || today.isBefore(end));
  }
}
