import 'package:flutter/material.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imagePath; // مسار الصورة

  const CustomCircleAvatar({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppPalette.bluePrimary, 
          width: 4,
        ),
      ),
      child: CircleAvatar(radius: 34, foregroundImage: AssetImage(imagePath)),
    );
  }
}
