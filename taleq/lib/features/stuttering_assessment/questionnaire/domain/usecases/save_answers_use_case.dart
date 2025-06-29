import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/entities/questionnaire.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/repositories/questionnaire_repository.dart';

class SaveAnswersUseCase implements UseCase<UserAnswerEntity, AnswerParams> {
  final QuestionnaireRepository repository;

  SaveAnswersUseCase({required this.repository});

  

  @override
  Future<Either<Failure, UserAnswerEntity>> call({
    required AnswerParams params,
  }) async {
    return await repository.saveUserAnswers(answers: params.answer);
  }
}

class AnswerParams {
  final Map<String, int> answer;

  AnswerParams({required this.answer});
}
