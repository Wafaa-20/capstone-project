import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class EditOption extends StatelessWidget {
  const EditOption({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    this.borderRadius,
    this.style,
    this.color,
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 53,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppPalette.whiteLight3,
          borderRadius: borderRadius,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  style ?? TextStyles.sf40016.copyWith(color: AppPalette.black),
            ),

            Icon(icon, size: 25, color: color ?? AppPalette.black),
          ],
        ),
      ),
    );
  }
}
