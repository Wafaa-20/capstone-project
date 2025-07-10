import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/exercises/domain/repositories/record_repository.dart';

class StopRecordingUsecase extends UseCase<void, StopRecordingParam> {
  final RecordRepository repository;

  StopRecordingUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(StopRecordingParam params) async {
    return await repository.stopRecording();
  }
}

class StopRecordingParam {}
