import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/home/domain/entities/go_live_entity.dart';
import 'package:taleq/features/home/domain/repositories/home_repository.dart';

class GoLiveUseCase implements UseCase<GoLiveEntity, GoLiveParams> {
  final HomeRepository repository;

  GoLiveUseCase({required this.repository});

  @override
  Future<Either<Failure, GoLiveEntity>> call(
    GoLiveParams params,
  ) async {
    return await repository.goLive(params.uid);
  }
}

class GoLiveParams {
  final String uid;
  
  GoLiveParams({required this.uid});
}
