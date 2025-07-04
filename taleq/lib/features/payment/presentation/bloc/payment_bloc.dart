import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_event.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    final int amount = 47;
    on<PaymentEvent>((event, emit) {});
    on<PaymentMethodEvent>(paymentMethod);
  }

  FutureOr<void> paymentMethod(
    PaymentMethodEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentLoading());
    try {
      // final response = await Moyasar.createPayment(
      //   publishableApiKey: dotenv.env['publishableApiKey'].toString(),
      //   amount: event.amount,
      //   description: 'order #1324',
      // );
    } catch (e) {
      emit(PaymentFailure(message: e.toString()));
    }
  }
}
