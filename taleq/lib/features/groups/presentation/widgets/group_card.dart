import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/groups/presentation/widgets/avatar_list.dart';

class GroupCard extends StatelessWidget {
  final String title;
  final String? date;
  final IconData? icon;
  final bool showButton;
  final double? width;
  final double? height;
  final List<String>? avatars;
  final Color background;
  final VoidCallback? onPressed;

  // خيارات إضافية:
  final bool showLeftIcon;
  final bool showRightIcon;
  final bool showDate;
  final bool translucentBackground;
  final bool showBorder;
  final Color borderColor;
  final Color? buttonColor;
  final TextStyle? titleStyle;
  final AlignmentGeometry? titleAlignment;
  final DecorationImage? backgroundImage;
  final bool iconOnTop;
  final int? usersCount;

  const GroupCard({
    super.key,
    this.title = '',
    this.date,
    this.icon,
    this.width,
    this.height,
    this.showButton = true,
    this.avatars,
    this.background = Colors.white,
    this.showLeftIcon = false,
    this.showRightIcon = false,
    this.showDate = true,
    this.translucentBackground = false,
    this.showBorder = false,
    this.borderColor = Colors.grey,
    this.onPressed,
    this.buttonColor,
    this.titleStyle,
    this.titleAlignment,
    this.backgroundImage,
    this.iconOnTop = false,
    this.usersCount,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = translucentBackground
        ? background.withOpacity(0.5)
        : background;

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: showBorder ? Border.all(color: borderColor, width: 1.5) : null,
        image: backgroundImage,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconOnTop && icon != null)
            Center(
              child: Column(
                children: [
                  Icon(icon, size: 32, color: AppPalette.bluePrimary),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style:
                        titleStyle ??
                        TextStyles.sf60020.copyWith(
                          fontSize: 14,
                          color: AppPalette.bluePrimary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else if (titleAlignment != null)
            Align(
              alignment: titleAlignment!,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showLeftIcon && icon != null)
                    Icon(icon, size: 24, color: AppPalette.bluePrimary),
                  if (showLeftIcon) const SizedBox(width: 6),
                  Text(
                    title,
                    style:
                        titleStyle ??
                        TextStyles.sf60020.copyWith(
                          fontSize: 17,
                          color: AppPalette.bluePrimary,
                        ),
                  ),
                  if (showRightIcon && icon != null)
                    Row(
                      children: [
                        const SizedBox(width: 120),
                        Icon(icon, size: 24, color: AppPalette.bluePrimary),
                      ],
                    ),
                ],
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (showLeftIcon && icon != null)
                      Icon(icon, size: 24, color: AppPalette.bluePrimary),
                    if (showLeftIcon) const SizedBox(width: 6),
                    Text(
                      title,
                      style:
                          titleStyle ??
                          TextStyles.sf60020.copyWith(
                            fontSize: 17,
                            color: AppPalette.bluePrimary,
                          ),
                      softWrap: true,
                    ),
                    if (showRightIcon && icon != null)
                      Row(
                        children: [
                          const SizedBox(width: 120),
                          Icon(icon, size: 24, color: AppPalette.bluePrimary),
                        ],
                      ),
                  ],
                ),
                if (avatars != null && avatars!.isNotEmpty)
                  AvatarList(avatars: avatars!, totalUsers: usersCount ?? 0),
              ],
            ),

          SizedBox(height: (showButton || showDate) ? 8 : 0),

          if (showDate || showButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showDate && date != null)
                  Row(
                    children: [
                      Icon(icon, size: 18, color: AppPalette.black),
                      const SizedBox(width: 8),
                      Text(
                        date!,
                        style: TextStyles.sf40014.copyWith(
                          color: AppPalette.black,
                        ),
                      ),
                    ],
                  ),
                if (showButton)
                  CustomButton(
                    onPressed: onPressed,
                    color: buttonColor ?? AppPalette.bluePrimary,
                    height: 8,
                    width: 100,
                    child: Text(
                      AppText.join,
                      style: TextStyles.sf30016.copyWith(
                        color: AppPalette.whiteLight,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
