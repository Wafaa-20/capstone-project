import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/home/data/models/go_live_model.dart';
import 'package:taleq/features/home/data/models/home_data_model.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/data/models/story_model.dart';

abstract class HomeDatasource {
  Future<HomeDataModel> getSpecialistAndStories();
  Future<String> insertStory(String title, String story);
  Future<GoLiveModel> goLive(String uid);
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

  @override
  Future<GoLiveModel> goLive(String uid) async {
    try {
      final String currentUserId = supabase.auth.currentUser!.id;
      final int currentUserAccount = _convertUserAccountToInt(currentUserId);
      log('👤 الحساب الحالي: $currentUserId ➡️ $currentUserAccount');

      final response = await supabase
          .from('lives')
          .select('channel_name, host_id')
          .eq('host_id', uid)
          .eq('is_active', true)
          .limit(1)
          .maybeSingle();

      if (response == null) {
        throw Exception('لم يتم العثور على بث مباشر لهذا المضيف');
      }

      final String channelName = response['channel_name'];
      final String hostId = response['host_id'];

      log('🎬 البيانات المستخرجة: channelName=$channelName, hostID=$hostId');

      final String token = await _fetchAgoraTokenFromBackend(
        channelName,
        currentUserAccount,
      );

      return GoLiveModel(
        userAccount: currentUserId,
        token: token,
        channelName: channelName,
        hostID: hostId,
        intUserAccount: currentUserAccount,
      );
    } catch (e) {
      log('❌ خطأ في goLive: $e');
      throw Exception('خطأ أثناء جلب بيانات البث: $e');
    }
  }

  int _convertUserAccountToInt(String uuid) {
    final hash = uuid.hashCode & 0x7FFFFFFF;
    log('🔢 تحويل userAccount إلى int: $uuid => $hash');
    return hash;
  }

  Future<String> _fetchAgoraTokenFromBackend(
    String channelName,
    int uid,
  ) async {
    log('🔑 طلب توكن لـ channel: $channelName و uid: $uid');

    final url = Uri.parse('http://hsat.masar10.com/api/taleqapi/token.php');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Ourkey': 'TALEQAPIPASSING',
      },
      body: jsonEncode({'channelName': channelName, 'uid': uid}),
    );

    if (response.statusCode != 200) {
      throw Exception('فشل إنشاء التوكن: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    if (data['status'] != 'success') {
      throw Exception('فشل إنشاء التوكن: ${data['message']}');
    }

    log('✅ تم الحصول على التوكن: ${data['token']}');
    return data['token'];
  }
}
