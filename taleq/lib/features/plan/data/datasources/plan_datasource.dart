import 'package:taleq/features/plan/data/models/plan_model.dart';

abstract class PlanDatasource {
  Future<PlanModel> getPlan();
}

class PlanDatasourceImpl implements PlanDatasource {
  @override
  Future<PlanModel> getPlan() async {
    // TODO: implement actual data source logic
    // This is just a placeholder implementation
    return PlanModel(
      id: '1',
      name: 'Plan Name',
    );
  }
}
