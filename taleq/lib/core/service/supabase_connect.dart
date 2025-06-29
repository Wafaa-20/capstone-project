import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static Supabase? supabase;
  // Initialize of Supabase
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");
      supabase = await Supabase.initialize(
        url: dotenv.env['url'].toString(),
        anonKey: dotenv.env['key'].toString(),
        authOptions: const FlutterAuthClientOptions(
          autoRefreshToken: true,
          authFlowType: AuthFlowType.pkce,
          detectSessionInUri: true,
        ),
      );
    } catch (e) {
      throw FormatException("There is error with connect DB");
    }
  }

  // static Future<void> addToCart({
  //   required int itemId,
  //   required String category,
  //   required double price,
  //   required int quantity,
  // }) async {
  //   int userId = 1;
  //   print(itemId);
  //   print(category);
  //   print(price);
  //   print(quantity);
  //   try {
  //     final response = await supabase?.client.from('cart').insert({
  //       'item_id': itemId,
  //       'category': category,
  //       'price': price,
  //       'quantity': quantity,
  //       'user_id': userId,
  //       'total': price,
  //     }).select(); // optional if you want to get inserted row

  //     if (response == null || response.isEmpty) {
  //       throw Exception("Failed to add to cart.");
  //     }
  //   } catch (e) {
  //     throw Exception("Error while adding to cart: $e");
  //   }
  // }

  // static Future<List<int>> getCartItemIds() async {
  //   final response = await supabase!.client.from('cart').select('item_id');
  //   return (response as List).map((row) => row['item_id'] as int).toList();
  // }
}
