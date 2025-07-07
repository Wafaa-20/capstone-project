import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/space/domain/entities/space.dart';

abstract class SpaceRepository {
  Future<Either<Failure, SpaceEntity>> getSpaceLists(
    String spaceID,
    String userID,
  );
  Future<Either<Failure, String>> addComment(
    String comment,
    String userID,
    String spaceID,
  );
}
