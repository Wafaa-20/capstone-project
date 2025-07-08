import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';

abstract class HomeDatasource {
  Future<List<SpecialistModel>> getSpecialistData();
}

class HomeDatasourceImpl implements HomeDatasource {
  final SupabaseClient supabase;
    HomeDatasourceImpl({required this.supabase});
  @override
  Future<List<SpecialistModel>> getSpecialistData() async {
  try {
    final response = await supabase
        .from('specialist')
        .select('id, image');

    final specialists = (response as List<dynamic>).map((item) {
      return SpecialistModel(
        id: item['id'],
        image: item['image']);
      }
    ).toList();

    return specialists;
  } catch (e) {
 
    throw Exception('Error fetching specialists: $e');
  }
}
}
