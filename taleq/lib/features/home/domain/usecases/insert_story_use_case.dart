import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/home/domain/repositories/home_repository.dart';

class InsertStoryUseCase implements UseCase<String, InsertStoryParams> {
  final HomeRepository repository;

  InsertStoryUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(
    InsertStoryParams params,
  ) async {
    return await repository.insertStory(params.title,params.story);
  }
}

class InsertStoryParams {
  final String title;
  final String story;
  InsertStoryParams({required this.title, required this.story});
}
