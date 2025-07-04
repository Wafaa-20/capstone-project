import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class SpacePage extends StatelessWidget {
  const SpacePage({super.key});
  // قائمة مؤقتة من المستخدمين
  final List<Map<String, dynamic>> users = const [
    {"name": "خالد", "image": null, "isSpeaking": true, "isMuted": false},
    {
      "name": "الأخصائي أحمد",
      "image":
          "https://randomuser.me/api/portraits/men/31.jpg", // صورة حقيقية مؤقتة
      "isSpeaking": true,
      "isMuted": false,
    },
    {
      "name": "الأخصائية سارة",
      "image": "https://randomuser.me/api/portraits/women/65.jpg", // صورة مؤقتة
      "isSpeaking": false,
      "isMuted": true,
    },
    {"name": "أحمد", "image": null, "isSpeaking": false, "isMuted": false},
    {"name": "عبدالله", "image": null, "isSpeaking": false, "isMuted": false},
    {"name": "ديما", "image": null, "isSpeaking": false, "isMuted": false},
  ];
  final Map<String, dynamic> spaceInfo = const {
    "title": "قصص ملهمة",
    "comments": 30,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            spaceInfo["title"],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        leading: const Icon(Icons.arrow_back_ios_new),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // شبكة المستخدمين
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.blue.shade100,
                            backgroundImage: user['image'] != null
                                ? NetworkImage(user['image'])
                                : null,
                            child: user['image'] == null
                                ? const Icon(Icons.person, size: 36)
                                : null,
                          ),
                          if (user['isSpeaking'] || user['isMuted'])
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  user['isMuted']
                                      ? Icons.mic_off
                                      : Icons.graphic_eq,
                                  color: user['isMuted']
                                      ? Colors.grey
                                      : Colors.blue,
                                  size: 18,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        user['name'],
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _iconWithLabel(
                        Icons.chat_bubble_outline,
                        spaceInfo["comments"].toString(),
                      ),
                      const SizedBox(width: 12),
                      _iconWithLabel(Icons.share, ""),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.mic, color: AppPalette.whiteLight),
                    label: Text("طلب التحدث", style: TextStyles.sf70020),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconWithLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        if (label.isNotEmpty) ...[const SizedBox(width: 4), Text(label)],
      ],
    );
  }
}
