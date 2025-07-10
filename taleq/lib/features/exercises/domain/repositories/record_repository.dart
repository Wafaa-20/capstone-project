import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/exercises/domain/entities/record_entitie.dart';

abstract class RecordRepository {
  Future<Either<Failure, void>> startRecording();
  Future<Either<Failure, void>> stopRecording();
  Stream<Either<Failure, RecordEntity>> getWaveformStream();
}
