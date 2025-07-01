import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/payment/domain/entities/payment.dart';

abstract class PaymentRepository {
  Future<Either<Failure, Payment>> getPayment();
}
