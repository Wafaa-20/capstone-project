import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/navigation/domain/entities/navigation.dart';

abstract class NavigationRepository {
  Future<Either<Failure, Navigation>> getNavigation();
}
