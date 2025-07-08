import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/space/domain/repositories/space_repository.dart';
import 'package:taleq/core/usecase/usecase.dart';

class AddCommentUseCase implements UseCase<String, CommentParams> {
  final SpaceRepository repository;

  AddCommentUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(CommentParams params) async {
    return await repository.addComment(
      params.comment,
      params.userID,
      params.spaceID,
    );
  }
}

class CommentParams {
  final String comment;
  final String userID;
  final String spaceID;

  CommentParams({
    required this.userID,
    required this.spaceID,
    required this.comment,
  });
}
