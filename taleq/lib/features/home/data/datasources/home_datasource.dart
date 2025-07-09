import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/home/data/models/home_data_model.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/story_model.dart';

abstract class HomeDatasource {
  Future<HomeDataModel> getSpecialistAndStories();
  Future<String> insertStory(String title, String story);
}

class HomeDatasourceImpl implements HomeDatasource {
  final SupabaseClient supabase;
  HomeDatasourceImpl({required this.supabase});
  @override
  Future<HomeDataModel> getSpecialistAndStories() async {
    try {
      final specialistResponse = await supabase
          .from('specialist')
          .select('uid, image');
      final specialists = (specialistResponse as List<dynamic>).map((item) {
        return SpecialistModel(
          id: item['uid'] ?? '',
          image: item['image'] ?? '',
        );
      }).toList();

      final storiesResponse = await supabase
          .from('inspirational_stories')
          .select('id, title, content, uid');

      final userIds = (storiesResponse as List<dynamic>)
          .map((item) => item['uid'])
          .whereType<String>()
          .toSet()
          .toList();

      final usersResponse = await supabase
          .from('user_profiles')
          .select('user_id, full_name, avatar_url')
          .inFilter('user_id', userIds);

      final usersMap = {
        for (var user in usersResponse as List<dynamic>)
          user['user_id']: {
            'full_name': user['full_name'] ?? 'مجهول',
            'avatar_url':
                user['avatar_url'] ??
                'https://oqomrjnyzqjfaqgjjvhi.supabase.co/storage/v1/object/public/avatars//clipart--person-icon--cliparts-15.png',
          },
      };

      final stories = storiesResponse.map((item) {
        final uid = item['uid'];
        final user =
            usersMap[uid] ??
            {
              'full_name': 'مجهول',
              'avatar_url':
                  'https://oqomrjnyzqjfaqgjjvhi.supabase.co/storage/v1/object/public/avatars//clipart--person-icon--cliparts-15.png',
            };
        return StoryModel(
          fullName: user['full_name']!,
          image: user['avatar_url']!,
          title: item['title'] ?? '',
          content: item['content'] ?? '',
        );
      }).toList();

      return HomeDataModel(specialists: specialists, stories: stories);
    } catch (e) {
      throw Exception('Error fetching home data: $e');
    }
  }

  @override
  Future<String> insertStory(String title, String story) async {
    try {
      final String uid = supabase.auth.currentUser!.id;
      final response = await supabase.from('inspirational_stories').insert({
        'title': title,
        'content': story,
        'uid': uid,
      });

      return "Success";
    } catch (e) {
      throw Exception('Error inserting story: $e');
    }
  }
}
