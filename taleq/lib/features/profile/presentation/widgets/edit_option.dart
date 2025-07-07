import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class EditOption extends StatelessWidget {
  const EditOption({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 25),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyles.sf50018.copyWith(color: AppPalette.black),
          ),
        ],
      ),
    );
  }
}
