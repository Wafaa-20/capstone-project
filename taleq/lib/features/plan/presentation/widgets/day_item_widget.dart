import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:taleq/features/plan/presentation/widgets/day_item.dart';

class DayItemWidget extends StatelessWidget {
  const DayItemWidget({super.key, this.controller});
  final EasyDatePickerController? controller;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final focusedDate = today;

    return EasyDateTimeLinePicker.itemBuilder(
      locale: Locale('ar'),
      controller: controller,
      firstDate: today,
      lastDate: DateTime(2030, 03, 18),
      focusedDate: focusedDate,
      itemExtent: 74.0,
      headerOptions: HeaderOptions(
        headerBuilder: (context, date, onPressed) {
          return const SizedBox.shrink();
        },
      ),

      itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
        return DayItem(
          date: date,
          isSelected: isSelected,
          isDisabled: isDisabled,
          isToday: isToday,
          onTap: onTap,
        );
      },
      onDateChange: (date) {},
    );
  }
}
