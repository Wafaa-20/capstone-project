import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/auth/domain/entities/change_password.dart';
part 'change_password_model.mapper.dart';

@MappableClass()
class ChangePasswordModel extends ChangePasswordEntity
    with ChangePasswordModelMappable {
  const ChangePasswordModel({required super.password, required super.email});
}
