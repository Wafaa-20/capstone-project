import 'dart:collection';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/groups/data/models/space_details_model.dart';
import 'package:taleq/features/groups/data/models/summary_spaces_model.dart';

abstract class GroupsRemoteDatasource {
  Future<Map<String, List<SummarySpace>>> getSummerySpaces();
  Future<SpaceDetails> getSpaceDetails(String spaceId);
}

class GroupsSupabaseDatasource implements GroupsRemoteDatasource {
  final SupabaseClient supabase;

  GroupsSupabaseDatasource({required this.supabase});

  @override
  Future<Map<String, List<SummarySpace>>> getSummerySpaces() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw const FormatException("User not authenticated");
      }

      final response = await supabase
          .from('spaces_view')
          .select()
          .timeout(const Duration(seconds: 30));

      final allSpaces = response.map<SummarySpace>((item) {
        final avatarsList = item['avatars'] as List<dynamic>? ?? [];
        return SummarySpace(
          id: item['space_id']?.toString() ?? '',
          title: item['title']?.toString() ?? '',
          startDate:
              DateTime.tryParse(item['start_date']?.toString() ?? '') ??
              DateTime.now(),
          endDate:
              DateTime.tryParse(item['end_date']?.toString() ?? '') ??
              DateTime.now(),
          avatars: UnmodifiableListView(
            avatarsList.map((e) => e?.toString()).whereType<String>(),
          ),
          usersCount: item['users_count'] as int? ?? 0,
          isActive: item['is_active'] as bool? ?? false,
          hostId: item['host_id']?.toString() ?? '',
        );
      }).toList();

      final userSpaces = allSpaces
          .where((space) => space.hostId == userId)
          .toList();
      final availableSpaces = allSpaces
          .where((space) => space.hostId != userId)
          .toList();

      return {'availableSpaces': availableSpaces, 'userSpaces': userSpaces};
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw const FormatException("Error fetching spaces.");
    }
  }

  @override
  Future<SpaceDetails> getSpaceDetails(String spaceId) async {
    try {
      final item = await supabase
          .from('space_details_view')
          .select()
          .eq('space_id', spaceId)
          .single()
          .timeout(const Duration(seconds: 30));

      final goalsList = item['goals'] as List<dynamic>? ?? [];

      return SpaceDetails(
        id: item['space_id']?.toString() ?? '',
        name: item['name']?.toString() ?? '',
        channelName: item['channel_name']?.toString() ?? '',
        startDate:
            DateTime.tryParse(item['start_date']?.toString() ?? '') ??
            DateTime.now(),
        endDate:
            DateTime.tryParse(item['end_date']?.toString() ?? '') ??
            DateTime.now(),
        numberOfSeats: item['max_participants'] as int? ?? 0,
        numberOfPepole: item['users_count'] as int? ?? 0,
        description: item['description']?.toString() ?? '',
        goals: goalsList
            .map((e) => e?.toString() ?? '')
            .whereType<String>()
            .toList(),
      );
    } on AuthException catch (e) {
      throw FormatException(e.message);
    } catch (e) {
      throw const FormatException("Error fetching space details.");
    }
  }
}
