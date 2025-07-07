import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CalendarTimeline extends StatelessWidget {
  const CalendarTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return TableCalendar(
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,

        titleTextStyle: TextStyles.sf60018,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: AppPalette.black,
        ),
        rightChevronIcon: Icon(Icons.chevron_right, color: AppPalette.black),
      ),
      availableGestures: AvailableGestures.all,
      focusedDay: today,
      firstDay: DateTime(today.year),
      lastDay: DateTime(today.year + 100, 12, 31),
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: (selectedDay, focusedDay) {
        // bloc.add(GetDateEvent(day: selectedDay));
      },
    );
  }
}
