import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/specialists/domain/entities/specialist_entities.dart';
import 'package:taleq/features/specialists/domain/repositories/specialists_repository.dart';

class GetSpecialistsUseCase
    implements UseCase<List<SpecialistEntities>, SpecialistsParam> {
  final SpecialistsRepository repository;

  GetSpecialistsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<SpecialistEntities>>> call(
    SpecialistsParam params,
  ) async {
    return await repository.getSpecialists();
  }
}

class SpecialistsParam {}
