import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';

part 'auth_model.mapper.dart';

@MappableClass()
class AuthModel extends AuthEntity with AuthModelMappable {
  AuthModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
  });
}
