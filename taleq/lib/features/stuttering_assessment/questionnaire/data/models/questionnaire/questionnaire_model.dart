import 'package:dart_mappable/dart_mappable.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/entities/questionnaire.dart';

part 'questionnaire_model.mapper.dart';

@MappableClass()
class UserAnswerModel extends UserAnswerEntity with UserAnswerModelMappable {
  const UserAnswerModel({ required super.answers});
}
