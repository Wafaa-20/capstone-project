import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/features/onboarding/data/models/onboarding_model.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/models/question/question_model.dart';

class ListConstants {
  static List<int> visitedPages = [];

  //Onboarding Data
  static List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: 'assets/image/onboarding1 (2).png',
      title: AppText.onbordingTitle1,
      subTitle: AppText.onbordingSubTitle1,
      btnText: AppText.start,
    ),
    OnboardingModel(
      image: 'assets/image/onboarding2.png',
      title: AppText.onbordingTitle2,
      subTitle: AppText.onbordingSubTitle2,
      btnText: AppText.next,
    ),
    OnboardingModel(
      image: 'assets/image/onboarding3.png',
      title: AppText.onbordingTitle3,
      subTitle: AppText.onbordingSubTitle3,
      btnText: AppText.startTest,
    ),
  ];
  static List<QuestionModel> questionnaireData = [
    //Q1
    QuestionModel(
      question: AppText.questionnaire1,
      options: [
        AppText.questionnaire1Answer1,
        AppText.questionnaire1Answer2,
        AppText.questionnaire1Answer3,
      ],
    ),
    //Q2
    QuestionModel(
      question: AppText.questionnaire2,
      options: [
        AppText.questionnaire2Answer1,
        AppText.questionnaire2Answer2,
        AppText.questionnaire2Answer3,
      ],
    ),
    //Q3
    QuestionModel(
      question: AppText.questionnaire3,
      options: [AppText.questionnaire3Answer1, AppText.questionnaire3Answer2],
    ),
    //Q5
    QuestionModel(
      question: AppText.questionnaire4,
      options: [
        AppText.questionnaire4Answer1,
        AppText.questionnaire4Answer2,
        AppText.questionnaire4Answer3,
      ],
    ),
  ];
}
