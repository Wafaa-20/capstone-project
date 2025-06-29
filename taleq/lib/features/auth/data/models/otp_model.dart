import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/auth/domain/entities/otp.dart';

part 'otp_model.mapper.dart';

@MappableClass()
class OTPModel extends OTPEntity with OTPModelMappable {
  const OTPModel({required super.email, required super.code});
}
