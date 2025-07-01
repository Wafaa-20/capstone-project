import 'package:taleq/features/payment/domain/entities/payment.dart';

class PaymentModel {
  final String id;
  final String name;

  PaymentModel({
    required this.id,
    required this.name,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Payment toEntity() {
    return Payment(
      id: id,
      name: name,
    );
  }
}
