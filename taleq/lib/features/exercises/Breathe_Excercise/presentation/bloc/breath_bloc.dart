// lib/breath/bloc/breath_bloc.dart
import 'dart:async';
//import 'dart:math'; // لاستخدام Math.sin أو Math.cos في الرسوم المتحركة

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_event.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_state.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/enum.dart';

class BreathingBloc extends Bloc<BreathingEvent, BreathingState> {
  Timer? _timer;
  int _totalSeconds = 0; // إجمالي الثواني للتمرين
  int _currentRemainingSeconds = 0;
  BreathingPhase _currentPhase = BreathingPhase.initial;
  int _selectedDurationIndex = 0; // لتعقب المدة المختارة في البلوك

  // متغيرات الرسوم المتحركة الداخلية للبلوك
  double _animationTime = 0.0; // من 0.0 إلى 1.0 لدورة تنفس واحدة
  static const int _inhaleDurationSeconds = 4;
  static const int _holdDurationSeconds = 2;
  static const int _exhaleDurationSeconds = 4;
  static const int _cycleDurationSeconds =
      _inhaleDurationSeconds +
      _holdDurationSeconds +
      _exhaleDurationSeconds; // 10 ثواني لدورة كاملة

  // متغير جديد لتتبع الوقت الفعلي لتقليل الثواني المتبقية
  DateTime? _lastSecondUpdateTime;

  BreathingBloc() : super(const BreathingInitialState()) {
    on<StartBreathingEvent>(_onStartBreathing);
    on<StopBreathingEvent>(_onStopBreathing);
    on<TickEvent>(_onTick);
    on<UpdateBreathingPhaseEvent>(_onUpdateBreathingPhase);
    on<SetDurationEvent>(_onSetDuration);
  }

  void _onSetDuration(SetDurationEvent event, Emitter<BreathingState> emit) {
    _selectedDurationIndex = event.selectedIndex;
    emit(BreathingInitialState(selectedDurationIndex: _selectedDurationIndex));
  }

  void _onStartBreathing(
    StartBreathingEvent event,
    Emitter<BreathingState> emit,
  ) {
    _totalSeconds = event.durationMinutes * 60;
    _currentRemainingSeconds = _totalSeconds;
    _currentPhase = BreathingPhase.initial; // ابدأ بالمرحلة الأولية
    _animationTime = 0.0; // إعادة تعيين وقت الرسوم المتحركة
    _lastSecondUpdateTime = DateTime.now(); // تهيئة وقت التحديث الأخير للثواني

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      add(
        TickEvent(
          remainingSeconds:
              _currentRemainingSeconds, // هذه القيمة سيتم تحديثها داخل _onTick
          currentPhase:
              _currentPhase, // هذه القيمة سيتم تحديثها بواسطة _onUpdateBreathingPhase
          scaleValue: _calculateScaleValue(), // هذه ستُحسب مع كل Tick
          opacityValue: _calculateOpacityValue(), // هذه ستُحسب مع كل Tick
        ),
      );
    });
    emit(
      BreathingRunningState(
        remainingSeconds: _currentRemainingSeconds,
        phase: _currentPhase,
        scaleValue: _calculateScaleValue(),
        opacityValue: _calculateOpacityValue(),
      ),
    );
    // ابدأ أول شهيق بعد فترة قصيرة
    Future.delayed(const Duration(milliseconds: 50), () {
      add(const UpdateBreathingPhaseEvent(BreathingPhase.inhale));
    });
  }

  void _onStopBreathing(
    StopBreathingEvent event,
    Emitter<BreathingState> emit,
  ) {
    _timer?.cancel();
    _currentRemainingSeconds = 0;
    _currentPhase = BreathingPhase.initial;
    _animationTime = 0.0; // إعادة تعيين وقت الرسوم المتحركة
    _lastSecondUpdateTime = null; // إعادة تعيين
    emit(BreathingInitialState(selectedDurationIndex: _selectedDurationIndex));
  }

  void _onTick(TickEvent event, Emitter<BreathingState> emit) {
    // تحديث الثواني المتبقية بناءً على الوقت الحقيقي
    if (_lastSecondUpdateTime != null) {
      final now = DateTime.now();
      final elapsedMilliseconds = now
          .difference(_lastSecondUpdateTime!)
          .inMilliseconds;
      if (elapsedMilliseconds >= 1000) {
        // إذا مرت ثانية واحدة أو أكثر
        _currentRemainingSeconds -=
            (elapsedMilliseconds ~/ 1000); // قلل الثواني المتبقية
        _lastSecondUpdateTime = now; // تحديث وقت التحديث الأخير
      }
    }

    if (_currentRemainingSeconds <= 0) {
      _timer?.cancel();
      _currentRemainingSeconds = 0; // تأكيد أن العد لا يذهب للسالب
      emit(const BreathingCompletedState());
      return;
    }

    // تحديث قيم الرسوم المتحركة
    _animationTime +=
        (50 / (_cycleDurationSeconds * 1000)); // نسبة التقدم لكل tick

    // تأكد من أن _animationTime لا يتجاوز 1.0 (دورة واحدة)
    if (_animationTime >= 1.0) {
      _animationTime = 0.0; // ابدأ دورة جديدة
      // عندما تبدأ دورة جديدة، تأكد من إعادة تعيين المرحلة إلى inhale
      _currentPhase = BreathingPhase.inhale; // يعيد الدائرة للشهيق
      add(
        const UpdateBreathingPhaseEvent(BreathingPhase.inhale),
      ); // تحديث نص المرحلة
    }

    emit(
      BreathingRunningState(
        remainingSeconds: _currentRemainingSeconds,
        phase:
            _currentPhase, // هذه المرحلة تم تحديثها بواسطة _onUpdateBreathingPhase أو في بداية الدورة
        scaleValue: _calculateScaleValue(),
        opacityValue: _calculateOpacityValue(),
      ),
    );
  }

  void _onUpdateBreathingPhase(
    UpdateBreathingPhaseEvent event,
    Emitter<BreathingState> emit,
  ) {
    _currentPhase = event.phase;
    if (state is BreathingRunningState) {
      emit((state as BreathingRunningState).copyWith(phase: _currentPhase));
    } else {
      // إذا لم يكن التمرين قيد التشغيل، ابدأه بالحالة الأولية للمرحلة
      emit(
        BreathingRunningState(
          remainingSeconds:
              _totalSeconds, // يجب أن تكون _totalSeconds مضبوطة بالفعل عند بدء التمرين
          phase: _currentPhase,
          scaleValue: _calculateScaleValue(),
          opacityValue: _calculateOpacityValue(),
        ),
      );
    }
  }

  // حساب قيمة التحجيم بناءً على وقت الرسوم المتحركة
  double _calculateScaleValue() {
    double progressInCycle =
        _animationTime *
        _cycleDurationSeconds; // الوقت الفعلي في الدورة (بالثواني)

    if (progressInCycle < _inhaleDurationSeconds) {
      // الشهيق: من 0.5 إلى 1.0 في _inhaleDurationSeconds
      return 0.5 + (0.5 * (progressInCycle / _inhaleDurationSeconds));
    } else if (progressInCycle <
        _inhaleDurationSeconds + _holdDurationSeconds) {
      // الاحتفاظ: ثابت عند 1.0
      return 1.0;
    } else {
      // الزفير: من 1.0 إلى 0.5 في _exhaleDurationSeconds
      double exhaleProgress =
          (progressInCycle - (_inhaleDurationSeconds + _holdDurationSeconds)) /
          _exhaleDurationSeconds;
      return 1.0 - (0.5 * exhaleProgress);
    }
  }

  // حساب قيمة الشفافية بناءً على وقت الرسوم المتحركة
  double _calculateOpacityValue() {
    double progressInCycle = _animationTime * _cycleDurationSeconds;

    if (progressInCycle < _inhaleDurationSeconds) {
      // الشهيق: من 0.2 إلى 0.8 في _inhaleDurationSeconds
      return 0.2 + (0.6 * (progressInCycle / _inhaleDurationSeconds));
    } else if (progressInCycle <
        _inhaleDurationSeconds + _holdDurationSeconds) {
      // الاحتفاظ: ثابت عند 0.8
      return 0.8;
    } else {
      // الزفير: من 0.8 إلى 0.2 في _exhaleDurationSeconds
      double exhaleProgress =
          (progressInCycle - (_inhaleDurationSeconds + _holdDurationSeconds)) /
          _exhaleDurationSeconds;
      return 0.8 - (0.6 * exhaleProgress);
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
