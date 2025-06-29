import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/navigation/domain/entities/navigation.dart';
import 'package:taleq/features/navigation/domain/repositories/navigation_repository.dart';

class GetNavigation {
  final NavigationRepository repository;

  GetNavigation(this.repository);

  Future<Either<Failure, Navigation>> call() async {
    return await repository.getNavigation();
  }
}
