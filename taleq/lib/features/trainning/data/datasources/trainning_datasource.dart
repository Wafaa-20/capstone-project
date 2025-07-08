import 'package:taleq/features/trainning/data/models/trainning_model.dart';

abstract class TrainningDatasource {
  Future<TrainningModel> getTrainning();
}

class TrainningDatasourceImpl implements TrainningDatasource {
  @override
  Future<TrainningModel> getTrainning() async {
    // TODO: implement actual data source logic
    // This is just a placeholder implementation
    return TrainningModel(
      id: '1',
      name: 'Trainning Name',
    );
  }
}
