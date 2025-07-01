import 'package:flutter/material.dart';

class AvatarList extends StatelessWidget {
  //avtar images
  final List<String> avatars;

  const AvatarList({super.key, required this.avatars});

  @override
  Widget build(BuildContext context) {
    //show 2 avtar
    int displayCount = avatars.length > 2 ? 2 : avatars.length;
    double totalWidth = (displayCount + (avatars.length > 2 ? 1 : 0)) * 24.0;

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
                backgroundImage: AssetImage(avatars[index]),
              ),
            );
          }),

          if (avatars.length > 2)
            Positioned(
              left: displayCount * 20,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: const Color(0xFFE6F07B),
                child: Text(
                  "+${avatars.length - displayCount}",
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
