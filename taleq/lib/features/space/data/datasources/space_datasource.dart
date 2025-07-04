import 'package:taleq/features/space/data/models/space_model.dart';

abstract class SpaceDatasource {
  Future<SpaceModel> getSpace();
}

class SpaceDatasourceImpl implements SpaceDatasource {
  @override
  Future<SpaceModel> getSpace() async {
    
    // This is just a placeholder implementation
    return SpaceModel(
      id: '1',
      name: 'Space Name',
    );
  }
}
