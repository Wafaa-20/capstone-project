import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  static void initialize() async {
    OneSignal.initialize('ad6236b8-b005-46c0-b845-f64b6a1b85fe');
    await OneSignal.Notifications.requestPermission(false);
  }

  static Future<void> sendNotificationByExternalId({
    required List<String> externalUserId,
    required String title,
    required String message,
  }) async {
    final url = Uri.parse('https://onesignal.com/api/v1/notifications');

    final body = {
      "app_id": 'ad6236b8-b005-46c0-b845-f64b6a1b85fe',
      "contents": {"en": message},
      "headings": {"en": title},
      "include_external_user_ids": externalUserId,
      "data": {"key": "1"},
    };

    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization':
          'Basic os_v2_app_vvrdnofqavdmbocf6zfwug4f723koptzb2geg3egw3vux6j6q7yfpf4n3wpphwl24hmt65t34yoh7qvzssyag347pfd4flf3zm5cvji',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Notification sent: ${response.body}');
    } else {
      print(' Failed: ${response.statusCode}');
      print(response.body);
    }
  }
}
