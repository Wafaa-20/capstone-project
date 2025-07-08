import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';

class AvatarList extends StatelessWidget {
  /// الصور الرمزية (روابط الصور أو المسارات).
  final List<String> avatars;

  /// العدد الكلي للمستخدمين في المساحة.
  final int totalUsers;

  const AvatarList({
    super.key,
    required this.avatars,
    required this.totalUsers,
  });

  @override
  Widget build(BuildContext context) {
    // نعرض 3 صور كحد أقصى
    int displayCount = avatars.length > 2 ? 2 : avatars.length;

    // عدد الأشخاص الباقين
    int remaining = totalUsers - displayCount;

    // نحجز مساحة لثلاث صور + واحدة للأرقام إن وجدت
    double totalWidth = (displayCount + (remaining > 0 ? 1 : 0)) * 24.0;

    return SizedBox(
      height: 32,
      width: totalWidth,
      child: Stack(
        children: [
          ...List.generate(displayCount, (index) {
            return Positioned(
              left: index * 24.0,
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(avatars[index]),
              ),
            );
          }),

          if (remaining > 0)
            Positioned(
              left: displayCount * 24.0,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Text(
                  '+${remaining.toString()}',
                  style: TextStyles.sf70012,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
