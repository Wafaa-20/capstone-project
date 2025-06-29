// import 'dart:convert';


// class NotificationService {
//   static Future<void> sendNotificationByExternalId({
//     required List<String> externalUserId,
//     required String title,
//     required String message,
//   }) async {
//     final url = Uri.parse('https://onesignal.com/api/v1/notifications');

//     final body = {
//       "app_id": 'c84c1557-1479-4080-9c51-1794438ed802',
//       "contents": {"en": message},
//       "headings": {"en": title},
//       "include_external_user_ids": externalUserId,
//       "data": {"key": "1"},
//     };

//     final headers = {
//       'Content-Type': 'application/json; charset=utf-8',
//       'Authorization':
//           'Basic os_v2_app_zbgbkvyupfaibhcrc6kehdwyajsswhhydgqu3s5heouizosfsektlra4sxvgntr2at3ffogyljibpqe7gprolqjrjazvyhea7dofacy',
//     };

//     final response = await http.post(
//       url,
//       headers: headers,
//       body: jsonEncode(body),
//     );

//     if (response.statusCode == 200) {
//       print('Notification sent: ${response.body}');
//     } else {
//       print(' Failed: ${response.statusCode}');
//       print(response.body);
//     }
//   }
// }
