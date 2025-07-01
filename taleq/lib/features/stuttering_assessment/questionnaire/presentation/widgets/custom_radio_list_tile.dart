import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/models/question/question_model.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_bloc.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_event.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile({
    super.key,
    required this.questionnaire,
    required this.bloc,
  });
  final QuestionModel questionnaire;
  final QuestionnaireBloc bloc;
  // Just for options
  @override
  Widget build(BuildContext context) {
    return Column(
      children: questionnaire.options.asMap().entries.map((option) {
        final answer = option.value;
        return Container(
          margin: const EdgeInsets.all(5),
          width: context.getWidth(),
          height: 58,
          decoration: BoxDecoration(
            color: bloc.userAnswers[questionnaire.question] == answer['value']
                ? AppPalette.blueLight
                : AppPalette.whitePrimary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppPalette.greyLight, width: 2),
          ),
          child: RadioListTile(
            title: Text(answer['key'].toString()),
            value: answer['value'],
            groupValue: bloc.userAnswers[questionnaire.question],
            onChanged: (value) {
              bloc.add(
                AnswerSelectedEvent(
                  question: questionnaire.question,
                  answerIndex: value!,
                ),
              );
            },
            activeColor: AppPalette.bluePrimary,
          ),
        );
      }).toList(),
    );
  }
}
