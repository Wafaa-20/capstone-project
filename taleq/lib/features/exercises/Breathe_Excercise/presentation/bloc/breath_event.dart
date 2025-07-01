// lib/breath/bloc/breath_event.dart
import 'package:equatable/equatable.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/enum.dart';

abstract class BreathingEvent extends Equatable {
  const BreathingEvent();

  @override
  List<Object> get props => [];
}

class StartBreathingEvent extends BreathingEvent {
  final int durationMinutes; // المدة بالدقائق

  const StartBreathingEvent(this.durationMinutes);

  @override
  List<Object> get props => [durationMinutes];
}

class StopBreathingEvent extends BreathingEvent {}

class TickEvent extends BreathingEvent {
  final int remainingSeconds;
  final BreathingPhase currentPhase;
  final double scaleValue; // قيمة التحجيم الحالية
  final double opacityValue; // قيمة الشفافية الحالية

  const TickEvent({
    required this.remainingSeconds,
    required this.currentPhase,
    required this.scaleValue,
    required this.opacityValue,
  });

  @override
  List<Object> get props => [
    remainingSeconds,
    currentPhase,
    scaleValue,
    opacityValue,
  ];
}

class UpdateBreathingPhaseEvent extends BreathingEvent {
  final BreathingPhase phase;

  const UpdateBreathingPhaseEvent(this.phase);

  @override
  List<Object> get props => [phase];
}

class SetDurationEvent extends BreathingEvent {
  final int selectedIndex; // الفهرس الجديد للمدة المختارة

  const SetDurationEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
