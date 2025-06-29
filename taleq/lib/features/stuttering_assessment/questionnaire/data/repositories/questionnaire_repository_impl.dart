import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/datasources/questionnaire_datasource.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/models/questionnaire/questionnaire_model.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/repositories/questionnaire_repository.dart';

class QuestionnaireRepositoryImpl implements QuestionnaireRepository {
  final QuestionnaireDatasource datasource;

  QuestionnaireRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserAnswerModel>> saveUserAnswers({
    required Map<String, int> answers,
  }) async {
    try {
      final result = await datasource.saveQuestionnaire(
        answerModel: UserAnswerModel(answers: answers),
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
