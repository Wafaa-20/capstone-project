import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/theme/app_palette.dart';

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
    backgroundColor: Colors.transparent,
    builder: (context) {
      final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

      return Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Container(
          height: height ?? context.getHeight() * 0.5,
          width: context.getWidth(),
          decoration: BoxDecoration(
            color: color ?? AppPalette.whitePrimary,
            borderRadius:
                borderRadius ?? BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(child: child),
        ),
      );
    },
  );
}
