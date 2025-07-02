part of 'navigation_bloc.dart';

@immutable
sealed class NavEvent {}

class ChangeNavigationSelectedEvent extends NavEvent {
  final int index;
  ChangeNavigationSelectedEvent({required this.index});
}
