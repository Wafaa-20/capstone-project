import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/specialists/domain/entities/specialist_entities.dart';

abstract class SpecialistsRepository {
  Future<Either<Failure, List<SpecialistEntities>>> getSpecialists();
}
