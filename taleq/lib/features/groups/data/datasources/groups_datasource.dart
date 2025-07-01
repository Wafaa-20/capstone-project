import 'package:taleq/features/groups/data/models/groups_model.dart';

abstract class GroupsDatasource {
  Future<GroupsModel> getGroups();
}

class GroupsDatasourceImpl implements GroupsDatasource {
  @override
  Future<GroupsModel> getGroups() async {
    
    // This is just a placeholder implementation
    return GroupsModel(
      id: '1',
      name: 'Groups Name',
    );
  }
}
