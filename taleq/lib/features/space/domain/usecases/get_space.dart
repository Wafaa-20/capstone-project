import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/space/domain/entities/space.dart';
import 'package:taleq/features/space/domain/repositories/space_repository.dart';

class GetSpace {
  final SpaceRepository repository;

  GetSpace(this.repository);

  Future<Either<Failure, Space>> call() async {
    return await repository.getSpace();
  }
}
