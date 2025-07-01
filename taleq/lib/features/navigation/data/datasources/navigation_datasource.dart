import 'package:taleq/features/navigation/data/models/navigation_model.dart';

abstract class NavigationDatasource {
  Future<NavigationModel> getNavigation();
}

class NavigationDatasourceImpl implements NavigationDatasource {
  @override
  Future<NavigationModel> getNavigation() async {
    
    // This is just a placeholder implementation
    return NavigationModel(
      id: '1',
      name: 'Navigation Name',
    );
  }
}
