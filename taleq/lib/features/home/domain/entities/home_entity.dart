import 'package:equatable/equatable.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/story_model.dart';

class HomeEntity extends Equatable {
  final List<SpecialistModel> specialists;
  final List<StoryModel> stories;
  const HomeEntity({required this.specialists, required this.stories});

  @override
  List<Object> get props => [specialists, stories];
}
