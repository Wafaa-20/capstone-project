import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/service/notification_service.dart';
import 'package:taleq/core/service/supabase_connect.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_event.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    final int amount = 4799;

    on<PaymentMethodEvent>(paymentMethod);
    on<SendNotification>(sendNotification);
  }
  FutureOr<void> sendNotification(
    SendNotification event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentLoading());
      log("hi note");
    try {
    
      final userID = SupabaseConnect.supabase!.client.auth.currentUser!.id;
      NotificationService.sendNotificationByExternalId(
        externalUserId: [userID],
        title: "taleq",
        message: "Payment Successfuly",
      );
    } catch (e) {
      emit(PaymentFailure(message: e.toString()));
    }
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
