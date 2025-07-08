import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/constants/list_constants.dart';
import 'package:taleq/core/widget/button/top_nav_actions.dart';
import 'package:taleq/core/widget/custom_cointenr_indicator.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:taleq/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:taleq/features/onboarding/presentation/widgets/text_content.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            context.go('/login');
          }
        },
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();

          final isLastPage =
              bloc.currentPage == ListConstants.onboardingData.length - 1;
          final isFirstPage = bloc.currentPage != 0;
          return Scaffold(
            body: PageView.builder(
              controller: bloc.pageController,
              itemCount: ListConstants.onboardingData.length,
              onPageChanged: (index) {
                bloc.add(UpdateCurrentPageEvent(pageIndex: index));
              },
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: SafeArea(
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TopNavActions(
                              showBack: isFirstPage ? true : false,
                              showSkip: !isLastPage ? true : false,
                              onPressedBack: () =>
                                  bloc.add(PreviousPageEvent()),
                              onPressedSkip: () =>
                                  bloc.add(CompleteOnboardingEvent()),
                            ),
                            SizedBox(height: 30),
                            CustomContainerIndicator(
                              totalPages: ListConstants.onboardingData.length,
                              visitedPages: ListConstants.visitedPages,
                              currentPage: bloc.currentPage,
                              width: 60,
                              height: 4,
                              spacing: 34,
                            ),
                            SizedBox(height: 50),
                            TextContent(
                              onboardingModel:
                                  ListConstants.onboardingData[index],
                            ),
                            SizedBox(height: 30),
                            Image.asset(
                              ListConstants.onboardingData[index].image,
                            ),

                            OnboardingButton(
                              bloc: bloc,
                              onboardingModel:
                                  ListConstants.onboardingData[index],
                              isLastPage: isLastPage,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
