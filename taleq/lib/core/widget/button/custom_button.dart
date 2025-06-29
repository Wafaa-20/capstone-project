import 'package:flutter/material.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
    this.width,
    this.height,
    this.sideColor,
    this.padding,
  });
  final void Function()? onPressed;
  final Widget child;
  final Color? color;
  final Color? sideColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
          side: BorderSide(
            color: sideColor ?? AppPalette.bluePrimary,
            width: 2,
          ),
        ),
        padding: padding ?? EdgeInsets.zero,

        backgroundColor: color ?? AppPalette.bluePrimary,
        foregroundColor: AppPalette.whitePrimary,
        fixedSize: Size(width ?? 200, height ?? 44),
      ),
      child: child,
    );
  }
}
