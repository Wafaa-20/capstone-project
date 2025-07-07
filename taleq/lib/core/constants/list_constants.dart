import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/features/onboarding/data/models/onboarding_model.dart';
import 'package:taleq/features/profile/data/models/profile_model.dart';
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
    // Q1
    QuestionModel(
      question: AppText.questionnaire1,
      options: [
        {"key": AppText.questionnaire1Answer1, "value": 1},
        {"key": AppText.questionnaire1Answer2, "value": 2},
        {"key": AppText.questionnaire1Answer3, "value": 3},
      ],
    ),

    // Q2
    QuestionModel(
      question: AppText.questionnaire2,
      options: [
        {"key": AppText.questionnaire2Answer1, "value": 4},
        {"key": AppText.questionnaire2Answer2, "value": 5},
        {"key": AppText.questionnaire2Answer3, "value": 6},
      ],
    ),

    // Q3
    QuestionModel(
      question: AppText.questionnaire3,
      options: [
        {"key": AppText.questionnaire3Answer1, "value": 7},
        {"key": AppText.questionnaire3Answer2, "value": 8},
      ],
    ),

    // Q4
    QuestionModel(
      question: AppText.questionnaire4,
      options: [
        {"key": AppText.questionnaire4Answer1, "value": 9},
        {"key": AppText.questionnaire4Answer2, "value": 10},
        {"key": AppText.questionnaire4Answer3, "value": 11},
      ],
    ),
  ];
  static List<String> words = [
    AppText.phrase1,
    AppText.phrase2,
    AppText.phrase3,
  ];
  static List<ProfileModel> profileData = [
    ProfileModel(
      icon: Icons.create_outlined,
      title: AppText.editProfile,
      iconBack: Icons.arrow_forward_ios,
      route: '/editProfile',
    ),
    ProfileModel(
      icon: Icons.notifications_active_outlined,
      title: AppText.reminders,
      iconBack: Icons.arrow_forward_ios,
      route: '/reminder',
    ),
    ProfileModel(
      icon: Icons.language_outlined,
      title: AppText.language,
      iconBack: Icons.arrow_forward_ios,
    ),
    ProfileModel(
      icon: Icons.phone_outlined,
      title: AppText.contactUs,
      iconBack: Icons.arrow_forward_ios,
    ),
    ProfileModel(
      icon: Icons.exit_to_app,
      title: AppText.logout,
      iconBack: Icons.logout,
    ),
  ];
}
