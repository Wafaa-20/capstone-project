import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/payment/data/datasources/payment_datasource.dart';
import 'package:taleq/features/payment/domain/entities/payment.dart';
import 'package:taleq/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDatasource datasource;

  PaymentRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Payment>> getPayment() async {
    try {
      final result = await datasource.getPayment();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
