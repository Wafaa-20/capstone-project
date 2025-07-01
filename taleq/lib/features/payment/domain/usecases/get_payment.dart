import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/payment/domain/entities/payment.dart';
import 'package:taleq/features/payment/domain/repositories/payment_repository.dart';

class GetPayment {
  final PaymentRepository repository;

  GetPayment(this.repository);

  Future<Either<Failure, Payment>> call() async {
    return await repository.getPayment();
  }
}
