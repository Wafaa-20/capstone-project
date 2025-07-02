import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/auth/domain/entities/forget_password.dart';
part 'forget_password_model.mapper.dart';

@MappableClass()
class ForgetPasswordModel extends ForgetPasswordEntity
    with ForgetPasswordModelMappable {
  const ForgetPasswordModel({required super.email});
}
