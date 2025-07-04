import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taleq/features/groups/presentation/pages/groups_page.dart';
import 'package:taleq/features/home/presentation/pages/home_page.dart';
import 'package:taleq/features/plan/presentation/pages/plan_page.dart';
import 'package:taleq/features/specialists/presentation/pages/specialists_page.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavEvent, NavState> {
  final List<Widget> pages = [
    HomePage(),
    GroupsPage(),
    PlanPage(),
    SpecialistsPage(),
    HomePage(),
  ];

  NavigationBloc() : super(NavigationSelectedState(0)) {
    on<ChangeNavigationSelectedEvent>(_onPageChanged);
  }

  void _onPageChanged(
    ChangeNavigationSelectedEvent event,
    Emitter<NavState> emit,
  ) {
    emit(NavigationSelectedState(event.index));
  }
}
