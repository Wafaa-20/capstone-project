import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
    required this.icons,
    this.onPressedList,
    this.spacing = 16,
    this.iconsSize,
  });
  final List<Widget> icons;
  final List<VoidCallback?>? onPressedList;
  final double spacing;
  final double? iconsSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(icons.length, (index) {
        final onPressed =
            (onPressedList != null && index < onPressedList!.length)
            ? onPressedList![index]
            : () {};

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: IconButton(
            onPressed: onPressed,
            icon: icons[index],
            iconSize: iconsSize,
          ),
        );
      }),
    );
  }
}
