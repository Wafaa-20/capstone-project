import 'dart:collection';
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/groups/data/models/join_details.dart';
import 'package:taleq/features/groups/data/models/space_details_model.dart';
import 'package:taleq/features/groups/data/models/summary_spaces_model.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_event.dart';
import 'package:taleq/features/space/data/models/space_model.dart';
import 'package:taleq/features/space/domain/entities/space.dart';

abstract class SpaceRemoteDatasource {
  Future<SpaceListsModel> getSpaceLists(String spaceID, String userID);
}

class SpaceSupabaseDatasource implements SpaceRemoteDatasource {
  final SupabaseClient supabase;

  SpaceSupabaseDatasource({required this.supabase});

  @override
  Future<SpaceListsModel> getSpaceLists(String spaceID, String userID) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw const FormatException("User not authenticated");
      }

      // 1. تفاصيل المساحة
      final spaceResponse = await supabase
          .from('spaces')
          .select('id, title, channel_name')
          .eq('id', spaceID)
          .single();

      final id = spaceResponse['id'] as String? ?? '';
      final name = spaceResponse['title'] as String? ?? '';
      final channelName = spaceResponse['channel_name'] as String? ?? '';

      // 2. الأعضاء
      final membersResponse = await supabase
          .from('space_members')
          .select('user_profiles:user_id(avatar_url, full_name)')
          .eq('space_id', spaceID);

      final users = (membersResponse as List<dynamic>).map((item) {
        final profile = item['user_profiles'];
        return {
          'name': profile['full_name'] ?? '',
          'avatar_url': profile['avatar_url'],
        };
      }).toList();


      final chatsResponse = await supabase
          .from('space_chats')
          .select('message, sent_at, user_profiles:user_id(full_name)')
          .eq('space_id', spaceID)
          .order('sent_at');

      final comments = (chatsResponse as List<dynamic>).map((chat) {
        return {
          'user': chat['user_profiles']['full_name'] ?? '',
          'message': chat['message'] ?? '',
          'sent_at': chat['sent_at'] ?? '',
        };
      }).toList();

      return SpaceListsModel(
        id: id,
        name: name,
        channelName: channelName,
        users: users,
        comments: comments,
      );
    } on AuthException catch (e) {
      log("message : $e");
      throw FormatException(e.message);
    } catch (e) {
      log("Error fetching space lists: $e");
      throw const FormatException("Error fetching space details.");
    }
  }
}
