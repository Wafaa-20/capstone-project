import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/models/questionnaire/questionnaire_model.dart';

abstract class QuestionnaireDatasource {
  Future<UserAnswerModel> saveQuestionnaire({
    required UserAnswerModel answerModel,
  });
}

class QuestionnaireDatasourceImpl implements QuestionnaireDatasource {
  final SupabaseClient supabase;

  QuestionnaireDatasourceImpl({required this.supabase});
  @override
  Future<UserAnswerModel> saveQuestionnaire({
    required UserAnswerModel answerModel,
  }) async {
    try {
      // Take user id from Login
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw FormatException("Current user not found");
      }
      await supabase.from('stuttering_condition').upsert({
        'user_id': userId,
        'when_stuttering_start': answerModel.answers[AppText.questionnaire2.tr()],
        'is_frist_stuttering_app': answerModel.answers[AppText.questionnaire3.tr()],
        'age': answerModel.answers[AppText.questionnaire1.tr()],
        'goal_of_use_taleq': answerModel.answers[AppText.questionnaire4.tr()],
      });
      return UserAnswerModel(answers: answerModel.answers);
    } on PostgrestException  catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("There is error with save answer");
    }
  }
}
