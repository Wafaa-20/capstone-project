import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/entities/questionnaire.dart';

abstract class QuestionnaireRepository {
  Future<Either<Failure, UserAnswerEntity>> saveUserAnswers({
    required Map<String, int> answers,
  });
}
