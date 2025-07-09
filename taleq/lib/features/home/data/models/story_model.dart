import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/home/data/models/story_model.mapper.dart';

@MappableClass()
class StoryModel with StoryModelMappable {
  final String fullName;
  final String image;
  final String title;
  final String content;

  StoryModel({
    required this.fullName,
    required this.image,
    required this.title,
    required this.content,
  });
}
