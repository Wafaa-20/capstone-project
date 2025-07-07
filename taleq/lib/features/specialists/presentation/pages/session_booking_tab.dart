import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/specialists/presentation/widgets/calendar_timeline.dart';

class SessionBookingTab extends StatelessWidget {
  const SessionBookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: CalendarTimeline()),
        SizedBox(height: 15),

        Text(AppText.time),
        SizedBox(height: 15),
        Container(
          height: 22,
          width: 53,
          decoration: BoxDecoration(
            color: AppPalette.greenSuccess,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(textAlign: TextAlign.center, "Time"),
        ),
        SizedBox(height: 53),
        CustomButton(
          width: 165,
          radius: 15,
          onPressed: () {},
          child: Text(AppText.bookSession),
        ),
      ],
    );
  }
}
