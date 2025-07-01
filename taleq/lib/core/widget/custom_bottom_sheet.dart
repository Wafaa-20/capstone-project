import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/theme/app_palette.dart';

Future customBottomSheet(BuildContext context, Widget child, {double? height,}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      height: height ?? 380,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: AppPalette.whitePrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: child,
    ),
  );
}
