import 'package:easy_localization/easy_localization.dart';
import 'package:taleq/core/text/app_text.dart';

class WordExercisModel {
  final String title;

  WordExercisModel({required this.title});

  List<WordExercisModel> wordExercisData = [
    WordExercisModel(title: AppText.onbordingTitle1.tr()),
    WordExercisModel(title: AppText.onbordingTitle1.tr()),
    WordExercisModel(title: AppText.onbordingTitle1.tr()),
  ];
}
