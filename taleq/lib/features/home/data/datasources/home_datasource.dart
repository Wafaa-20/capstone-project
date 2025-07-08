import 'dart:developer';

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
    log("start");
    try {
      final response = await supabase.from('specialist').select('uid, image');
      log(response.toString());
      final specialists = (response as List<dynamic>).map((item) {
        return SpecialistModel(id: item['uid'] ?? '', image: item['image']);
      }).toList();
      log(specialists.toString());
      return specialists;
    } catch (e) {
      log(e.toString());
      throw Exception('Error fetching specialists: $e');
    }
  }
}
