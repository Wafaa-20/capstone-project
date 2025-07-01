import 'package:taleq/core/text/app_text.dart';

class WordExercisModel {
  final String title;

  WordExercisModel({required this.title});

  List<WordExercisModel> WordExercisData = [
    WordExercisModel(title: AppText.onbordingTitle1),
    WordExercisModel(title: AppText.onbordingTitle1),
    WordExercisModel(title: AppText.onbordingTitle1),
  ];
}
