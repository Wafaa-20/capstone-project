import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/specialists/data/models/specialists_model.dart';

abstract class SpecialistsDatasource {
  Future<List<SpecialistsModel>> getSpecialists();
}

class SpecialistsDatasourceImpl implements SpecialistsDatasource {
  final SupabaseClient supabase;

  SpecialistsDatasourceImpl({required this.supabase});

  @override
  Future<List<SpecialistsModel>> getSpecialists() async {
    try {
      final response = await supabase.from('specialist').select();

      print("Specialist: $response");

      final x = response.map((e) => SpecialistsModelMapper.fromMap(e)).toList();
      // print("**********The List : $x");
      return x;
    } catch (e) {
      throw FormatException("There is error with save answer");
    }
  }
}
