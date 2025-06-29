import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isDisabled,
    required this.isToday,
    required this.onTap,
  });
  final DateTime date;
  final bool isSelected;
  final bool isDisabled;
  final bool isToday;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dateFormate = DateFormat('EEEE', 'ar').format(date);
    final dateOnly = DateTime(date.year, date.month, date.day);
    final int diff = dateOnly
        .difference(DateTime(today.year, today.month, today.day))
        .inDays;

    final String dayLabel = diff == 0
        ? AppText.today.tr()
        : diff == 1
        ? AppText.tomorrow.tr()
        : dateFormate;
    return InkResponse(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        decoration: BoxDecoration(
          color: isToday || isSelected
              ? AppPalette.whitePrimary
              : AppPalette.whiteLight,
          border: Border.all(
            color: isToday || isSelected
                ? AppPalette.black
                : AppPalette.grayLight,
            width: isToday || isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              dayLabel,
              style: TextStyles.sf40012.copyWith(
                color: isSelected
                    ? AppPalette.blackLight
                    : AppPalette.grayPrimary,
              ),
            ),
            SizedBox(height: 3),
            Text(
              date.day.toString(),
              style: TextStyles.sf70020.copyWith(
                color: isSelected
                    ? AppPalette.blackLight
                    : AppPalette.grayPrimary,
              ),
            ),
            SizedBox(height: 3),
            isToday
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 5,
                      color: AppPalette.greenSuccess,
                      backgroundColor: AppPalette.greyLight,
                    ),
                  )
                : Icon(
                    Icons.lock_outlined,
                    size: 25,
                    color: AppPalette.greyLight,
                  ),
          ],
        ),
      ),
    );
  }
}
