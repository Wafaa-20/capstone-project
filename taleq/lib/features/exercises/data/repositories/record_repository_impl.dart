import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/exercises/data/datasource/recoer_datasource.dart';
import 'package:taleq/features/exercises/domain/entities/record_entitie.dart';
import 'package:taleq/features/exercises/domain/repositories/record_repository.dart';

class RecordRepositoryImpl implements RecordRepository {
  final RecordDatasource datasource;

  RecordRepositoryImpl({required this.datasource});

  @override
  Stream<Either<Failure, RecordEntity>> getWaveformStream() {
    return datasource
        .getWaveformStream()
        // كل عنصر هنا إما Failure أو RecordModel
        .map<Either<Failure, RecordEntity>>(
          (eitherModel) => eitherModel.fold(
            // إذا كان فشل، راسل الفشل مباشرة
            (failure) => Left(failure),
            // إذا كان نجاح، حوّل RecordModel إلى RecordEntity
            (model) => Right<Failure, RecordEntity>(model),
          ),
        )
        // لو حصل استثناء في الستريم نفسه
        .handleError((e) => Left(ServerFailure(message: e.toString())));
  }

  @override
  Future<Either<Failure, void>> startRecording() async {
    try {
       await datasource.startRecording();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> stopRecording() async {
    try {
       await datasource.stopRecording();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
