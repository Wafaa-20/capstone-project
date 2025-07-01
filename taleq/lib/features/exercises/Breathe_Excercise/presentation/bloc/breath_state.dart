// lib/breath/bloc/breath_state.dart
import 'package:equatable/equatable.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/enum.dart';

abstract class BreathingState extends Equatable {
  const BreathingState();

  @override
  List<Object> get props => [];
}

class BreathingInitialState extends BreathingState {
  final int selectedDurationIndex; // لتخزين المدة المختارة

  const BreathingInitialState({this.selectedDurationIndex = 0});

  @override
  List<Object> get props => [selectedDurationIndex];
}

class BreathingRunningState extends BreathingState {
  final int remainingSeconds;
  final BreathingPhase phase;
  final double scaleValue; // قيمة التحجيم الحالية للرسوم المتحركة
  final double opacityValue; // قيمة الشفافية الحالية للرسوم المتحركة

  const BreathingRunningState({
    required this.remainingSeconds,
    required this.phase,
    this.scaleValue = 0.5, // قيم افتراضية
    this.opacityValue = 0.2, // قيم افتراضية
  });

  BreathingRunningState copyWith({
    int? remainingSeconds,
    BreathingPhase? phase,
    double? scaleValue,
    double? opacityValue,
  }) {
    return BreathingRunningState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      phase: phase ?? this.phase,
      scaleValue: scaleValue ?? this.scaleValue,
      opacityValue: opacityValue ?? this.opacityValue,
    );
  }

  @override
  List<Object> get props => [remainingSeconds, phase, scaleValue, opacityValue];
}

class BreathingCompletedState extends BreathingState {
  const BreathingCompletedState();
}
