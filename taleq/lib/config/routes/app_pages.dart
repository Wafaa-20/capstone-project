import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/features/auth/presentation/pages/change_password_page.dart';
import 'package:taleq/features/auth/presentation/pages/forget_password_page.dart';
import 'package:taleq/features/auth/presentation/pages/login_page.dart';
import 'package:taleq/features/auth/presentation/pages/signup_page.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/page/breathing_excercise_page.dart';
import 'package:taleq/features/exercises/Words_Excercise/presentation/pages/words_excercise_page.dart';
import 'package:taleq/features/exercises/Words_Excercise/presentation/pages/words_excercise_start_page.dart';
import 'package:taleq/features/exercises/Words_Excercise_start/presentation/page/intro_words_excercise_page.dart';
import 'package:taleq/features/exercises/presentation/page/task_success_page.dart';
import 'package:taleq/features/groups/presentation/pages/groups_page.dart';

import 'package:taleq/features/home/presentation/pages/home_page.dart';
import 'package:taleq/features/navigation/presentation/pages/navigation_page.dart';
import 'package:taleq/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:taleq/features/payment/presentation/pages/payment_page.dart';
import 'package:taleq/features/plan/presentation/pages/plan_page.dart';
import 'package:taleq/features/space/presentation/pages/space_page.dart';
import 'package:taleq/features/specialists/presentation/pages/specialists_page.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:taleq/features/splash/presentation/pages/splash_page.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/pages/assessment_result_page.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/pages/camera_start_page.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/pages/camera_test_page.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/pages/questionnaire_page.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/pages/questionnaire_start_page.dart';

import 'app_routes.dart';

final router = GoRouter(
  initialLocation: '/navigation',
  navigatorKey: GlobalNavigation.instance.navigatorKey,
  routes: [
    GoRoute(
      name: Names.splash,
      path: Routes.splash,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SplashBloc(),
          child: const SplashPage(),
        );
      },
    ),

    GoRoute(
      name: Names.questionnaire,
      path: Routes.questionnaire,
      builder: (context, state) => const QuestionnairePage(),
    ),
    GoRoute(
      name: Names.startQuestionnaire,
      path: Routes.startQuestionnaire,
      builder: (context, state) => const QuestionnaireStartPage(),
    ),

    GoRoute(
      name: Names.cameraAnalysis,
      path: Routes.cameraAnalysis,
      builder: (context, state) => const CameraTestPage(),
    ),
    GoRoute(
      name: Names.startCamera,
      path: Routes.startCamera,
      builder: (context, state) => const CameraStartPage(),
    ),
    GoRoute(
      name: Names.assessmentResult,
      path: Routes.assessmentResult,
      builder: (context, state) => const AssessmentResultPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SplashBloc(),
          child: const SplashPage(),
        );
      },
    ),
    GoRoute(
      path: '/login-callback',
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      name: Names.navigation,
      path: Routes.navigation,
      builder: (context, state) => const NavigationPage(),
    ),
    GoRoute(
      name: Names.specialists,
      path: Routes.specialists,
      builder: (context, state) => const SpecialistsPage(),
    ),

    GoRoute(
      name: Names.home,
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: Names.success,
      path: Routes.success,
      builder: (context, state) => const TaskSuccessPage(),
    ),

    //EX 1
    GoRoute(
      name: Names.srartexercise,
      path: Routes.srartexercise,
      builder: (context, state) => const IntroWordsExercisePage(),
    ),
    //Ex 2
    GoRoute(
      name: Names.breathing,
      path: Routes.breathing,
      builder: (context, state) => const BreathingExercisePage(),
    ),
    //Ex 3
    GoRoute(
      name: Names.words,
      path: Routes.words,
      builder: (context, state) => const WordsExercisePage(),
    ),
    GoRoute(
      name: Names.srartwords,
      path: Routes.srartwords,
      builder: (context, state) => const WordsExerciseStartPage(),
    ),

    GoRoute(
      name: Names.payment,
      path: Routes.payment,
      builder: (context, state) => const PaymentPage(),
    ),
    GoRoute(
      name: Names.onboarding,
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      name: Names.login,
      path: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      name: Names.signup,
      path: Routes.signup,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      name: Names.plan,
      path: Routes.plan,
      builder: (context, state) => const PlanPage(),
    ),
    GoRoute(
      name: Names.forgetPassword,
      path: Routes.forgetPassword,
      builder: (context, state) => const ForgetPasswordPage(),
    ),
    GoRoute(
      path: '/change_password',
      builder: (context, state) {
        final email = state.uri.queryParameters['email'];
        return ChangePasswordPage(email: email!);
      },
    ),
    GoRoute(
      name: Names.space,
      path: '/space',
      builder: (context, state) {
        final token = state.uri.queryParameters['token'];
        final userID = state.uri.queryParameters['userID'];
        final spaceID = state.uri.queryParameters['spaceID'];

        return SpacePage(userID: userID!, token: token!, spaceID: spaceID!);
      },
    ),
    GoRoute(
      name: Names.groups,
      path: Routes.groups,
      builder: (context, state) => const GroupsPage(),
    ),
  ],
);

class GlobalNavigation {
  static final GlobalNavigation instance = GlobalNavigation._internal();
  GlobalNavigation._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
