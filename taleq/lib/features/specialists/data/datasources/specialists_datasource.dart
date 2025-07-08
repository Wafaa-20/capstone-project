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
      print("LIST : $response");
      print("++++++++++++++++++++++++++++++++++++++++");
      print(
        "THE LIST With MAP : ${response.map((e) => SpecialistsModelMapper.fromMap(e)).toList()}",
      );

      return response.map((e) => SpecialistsModelMapper.fromMap(e)).toList();
    } on PostgrestException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw FormatException("There is error with $e");
    }
  }
}
