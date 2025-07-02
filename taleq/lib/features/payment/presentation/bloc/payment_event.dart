import 'package:equatable/equatable.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentMethodEvent extends PaymentEvent {
  final int amount;
  const PaymentMethodEvent(this.amount);

  @override
  List<Object> get props => [amount];
}
