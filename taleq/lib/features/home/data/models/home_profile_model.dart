import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/home_profile_model.mapper.dart';


@MappableClass()
class HomeProfileModel with HomeProfileModelMappable {
  final String userID;
  final String fullName;
  final String avatar;

  HomeProfileModel({
    required this.userID,
    required this.fullName,
    required this.avatar,
  });
}
