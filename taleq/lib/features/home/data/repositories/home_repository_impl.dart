import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/home/data/datasources/home_datasource.dart';
import 'package:taleq/features/home/data/models/go_live_model.dart';
import 'package:taleq/features/home/data/models/home_data_model.dart';
import 'package:taleq/features/home/domain/entities/go_live_entity.dart';
import 'package:taleq/features/home/domain/entities/home_entity.dart';
import 'package:taleq/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, HomeEntity>> getSpecialistAndStories() async {
    try {
      final result = await datasource.getSpecialistAndStories();
      final entity = result.toEntity();
      return Right(entity);
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }

  @override
  Future<Either<Failure, String>> insertStory(title, story) async {
    try {
      final result = await datasource.insertStory(title, story);
      return Right(result);
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }

  @override
  Future<Either<Failure, GoLiveEntity>> goLive(uid) async {
    try {
      final result = await datasource.goLive(uid);

      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
