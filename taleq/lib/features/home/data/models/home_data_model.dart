import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/home_profile_model.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/story_model.dart';
import 'package:taleq/features/home/domain/entities/home_entity.dart';

@MappableClass()
class HomeDataModel {
  final List<SpecialistModel> specialists;
  final List<StoryModel> stories;
  final HomeProfileModel profile;

  HomeDataModel({
    required this.specialists,
    required this.stories,
    required this.profile,
  });
}

extension HomeDataModelToEntityMapper on HomeDataModel {
  HomeEntity toEntity() {
    return HomeEntity(
      specialists: specialists,
      stories: stories,
      profile: profile,
    );
  }
}
