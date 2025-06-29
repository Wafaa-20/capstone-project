import 'package:equatable/equatable.dart';

class UserAnswerEntity extends Equatable {
  final Map<String, int> answers;

  const UserAnswerEntity({required this.answers});

  @override
  List<Object> get props => [answers];
}
