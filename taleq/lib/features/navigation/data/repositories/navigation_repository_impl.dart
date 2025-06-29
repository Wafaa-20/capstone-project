import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/navigation/data/datasources/navigation_datasource.dart';
import 'package:taleq/features/navigation/domain/entities/navigation.dart';
import 'package:taleq/features/navigation/domain/repositories/navigation_repository.dart';

class NavigationRepositoryImpl implements NavigationRepository {
  final NavigationDatasource datasource;

  NavigationRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Navigation>> getNavigation() async {
    try {
      final result = await datasource.getNavigation();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
