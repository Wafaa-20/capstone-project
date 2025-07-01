import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_event.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>((event, emit) {
      
    });
  }
}
