import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/lives/data/models/lives_model.dart';

abstract class LivesDatasource {
  Future<LivesModel> getLives();
}

class LivesDatasourceImpl implements LivesDatasource {
  final SupabaseClient supabase;
  LivesDatasourceImpl({required this.supabase});

  @override
  Future<LivesModel> getLives() async {
    // TODO: implement actual data source logic
    // This is just a placeholder implementation
    return LivesModel(id: '1', name: 'Lives Name');
  }
}
