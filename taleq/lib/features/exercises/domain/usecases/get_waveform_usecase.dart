import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/exercises/domain/entities/record_entitie.dart';
import 'package:taleq/features/exercises/domain/repositories/record_repository.dart';

class GetWaveformUsecase
    extends UseCase<Stream<Either<Failure, RecordEntity>>, GetWaveformParam> {
  final RecordRepository repository;

  GetWaveformUsecase({required this.repository});

  @override
  Future<Either<Failure, Stream<Either<Failure, RecordEntity>>>> call(
    GetWaveformParam params,
  ) async {
    return Right(repository.getWaveformStream());
  }
}

class GetWaveformParam {}
