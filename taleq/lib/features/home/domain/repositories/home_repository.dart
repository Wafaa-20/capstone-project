import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/home/domain/entities/go_live_entity.dart';
import 'package:taleq/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getSpecialistAndStories();
  Future<Either<Failure, String>> insertStory(title, story);
  Future<Either<Failure, GoLiveEntity>> goLive(uid);
}
