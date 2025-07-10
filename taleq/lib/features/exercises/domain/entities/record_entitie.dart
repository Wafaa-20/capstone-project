import 'package:equatable/equatable.dart';

class RecordEntity extends Equatable {
  final List<double> amplitudes;

  const RecordEntity({required this.amplitudes});

  @override
  List<Object> get props => [amplitudes];
}
