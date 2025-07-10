import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/specialist_model.mapper.dart';
import 'package:taleq/features/home/data/models/story_model.dart';
import 'package:taleq/features/home/data/models/story_model.mapper.dart';
import 'package:taleq/features/home/domain/entities/home_entity.dart';

part 'home_data_model.mapper.dart';

@MappableClass()
class HomeDataModel with HomeDataModelMappable {
  final List<SpecialistModel> specialists;
  final List<StoryModel> stories;

  HomeDataModel({required this.specialists, required this.stories});
}

extension HomeDataModelToEntityMapper on HomeDataModel {
  HomeEntity toEntity() {
    return HomeEntity(specialists: specialists, stories: stories);
  }
}
