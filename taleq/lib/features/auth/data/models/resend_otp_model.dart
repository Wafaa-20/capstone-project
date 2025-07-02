import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/auth/domain/entities/resend_otp.dart';
part 'resend_otp_model.mapper.dart';
@MappableClass()
class ResendOTPModel extends ResendOTPEntity with ResendOTPModelMappable {
  const ResendOTPModel({required super.email});
}
