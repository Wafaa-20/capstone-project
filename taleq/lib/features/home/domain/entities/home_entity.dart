import 'package:equatable/equatable.dart';
import 'package:taleq/features/home/data/models/home_profile_model.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/story_model.dart';

class HomeEntity extends Equatable {
  final List<SpecialistModel> specialists;
  final List<StoryModel> stories;
  final HomeProfileModel profile;
  const HomeEntity({
    required this.specialists,
    required this.stories,
    required this.profile,
  });

  @override
  List<Object> get props => [specialists, stories, profile];
}
