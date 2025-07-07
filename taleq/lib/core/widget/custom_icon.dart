import 'package:flutter/material.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.isWithContainer = false,
    this.color,
    this.size,
  });

  final IconData icon;
  final bool isWithContainer;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return isWithContainer
        ? Container(
            width: 35,
            height: 35,
            // padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppPalette.bluePrimary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: size ?? 24, color: AppPalette.whitePrimary),
          )
        : Icon(icon, size: size ?? 24, color: color ?? AppPalette.black);
  }
}
