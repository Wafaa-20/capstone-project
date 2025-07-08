import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';

Future customBottomSheet(
  BuildContext context,
  Widget child, {
  double? height,
  Color? color,
  BorderRadiusGeometry? borderRadius,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // barrierColor: Colors.transparent,
    builder: (context) => Container(
      height: height ?? 380,
      width: context.getWidth(),
      decoration: BoxDecoration(
        // color: color ?? AppPalette.whitePrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: child,
    ),
  );
}
