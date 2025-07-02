import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'groups_event.dart';
import 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final title = TextEditingController();
  final details = TextEditingController();

  GroupsBloc() : super(GroupsInitial(showButton: false)) {
    on<TitleChanged>((event, emit) {
      //make shure user input
      emit(GroupsInitial(showButton: event.text.trim().isNotEmpty));
    });
  }
}
