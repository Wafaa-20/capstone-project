import 'package:flutter/material.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.color,
    this.size,
    this.withContainer = false,
  });
  final void Function()? onPressed;
  final IconData icon;
  final Color? color;
  final double? size;
  final bool withContainer;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: withContainer
          ? Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppPalette.whiteLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color ?? AppPalette.bluePrimary,
                size: size ?? 24,
              ),
            )
          : Icon(
              icon,
              color: color ?? AppPalette.bluePrimary,
              size: size ?? 24,
            ),
    );
  }
}
