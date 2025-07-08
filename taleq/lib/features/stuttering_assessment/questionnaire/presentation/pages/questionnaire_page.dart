import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/constants/list_constants.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/top_nav_actions.dart';
import 'package:taleq/core/widget/custom_cointenr_indicator.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_bloc.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_event.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_state.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/widgets/custom_radio_list_tile.dart';

class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<QuestionnaireBloc>(),
      child: BlocConsumer<QuestionnaireBloc, QuestionnaireState>(
        listener: (context, state) {
          if (state is SubmitSuccessState) {
            context.go('/startCamera');
          } else if (state is SubmitFailureState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final bloc = context.read<QuestionnaireBloc>();
          final isLastPage =
              bloc.currentPage == ListConstants.questionnaireData.length - 1;
          return Scaffold(
            body: PageView.builder(
              controller: bloc.pageController,
              itemCount: ListConstants.questionnaireData.length,
              onPageChanged: (index) {
                bloc.add(UpdatePageEvent(pageIndex: index));
              },
              itemBuilder: (BuildContext context, int index) {
                final list = ListConstants.questionnaireData[index];
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopNavActions(
                          onPressedBack: () {
                            bloc.add(PreviousPageEvent());
                          },
                          onPressedSkip: () {},
                        ),
                        SizedBox(height: 44),
                        Center(
                          child: CustomContainerIndicator(
                            totalPages: ListConstants.questionnaireData.length,
                            visitedPages: ListConstants.visitedPages,
                            currentPage: bloc.currentPage,
                          ),
                        ),
                        SizedBox(height: 70),
                        Text(list.question, style: TextStyles.sf60024),
                        SizedBox(height: 25),
                        CustomRadioListTile(questionnaire: list, bloc: bloc),
                        SizedBox(height: 40),
                        Center(
                          child: CustomButton(
                            onPressed: () {
                              isLastPage
                                  ? bloc.add(SubmitAnswersEvent())
                                  : bloc.add(NextPageEvent());
                            },
                            child: Text(
                              isLastPage
                                  ? AppText.done.tr()
                                  : AppText.next.tr(),
                              style: TextStyles.sf70020,
                            ),
                          ),
                        ),
                      ],
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
