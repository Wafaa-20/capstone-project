import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/home/domain/entities/specialist_entity.dart';
import 'package:taleq/features/home/domain/repositories/home_repository.dart';

class SpecialistUseCase {
  final HomeRepository repository;

  SpecialistUseCase({required this.repository});

  Future<Either<Failure, List<SpecialistEntity>>> call() async {
    return await repository.getSpecialistData();
  }
}
