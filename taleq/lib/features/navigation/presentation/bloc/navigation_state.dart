part of 'navigation_bloc.dart';

@immutable
sealed class NavState {}

final class NavInitial extends NavState {}

class NavigationSelectedState extends NavState {
  final int selectedIndex;
  NavigationSelectedState(this.selectedIndex);
}
