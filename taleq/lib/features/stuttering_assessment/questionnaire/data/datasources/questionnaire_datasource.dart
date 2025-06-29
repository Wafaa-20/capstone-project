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
      await supabase.from('stuttering_condition').insert({
        'user_id': userId,
        'when_stuttering_start': answerModel.answers[AppText.questionnaire1],
        'is_fristtering_app': answerModel.answers[AppText.questionnaire2],
        'age': answerModel.answers[AppText.questionnaire3],
        'goal_of_use_taleq': answerModel.answers[AppText.questionnaire4],
      });
      return UserAnswerModel(answers: answerModel.answers);
    } on AuthException catch (e) {
      print("AuthException: $e");
      throw FormatException(e.message);
    } catch (e) {
      print("FormatException: $e");
      throw FormatException("There is error with save answer");
    }
  }
}
