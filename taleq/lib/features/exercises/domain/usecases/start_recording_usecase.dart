import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/exercises/domain/repositories/record_repository.dart';

class StartRecordingUsecase extends UseCase<void, StartRecordingParam> {
  final RecordRepository repository;

  StartRecordingUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(StartRecordingParam params) async {
    return await repository.startRecording();
  }
}

class StartRecordingParam {}
