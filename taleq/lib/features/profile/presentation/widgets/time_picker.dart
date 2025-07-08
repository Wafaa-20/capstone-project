import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_text_button.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextButton(
            onPressed: () {},
            text: 'تم'.tr(),
            styles: TextStyles.sf60018.copyWith(color: AppPalette.iosBlue),
          ),
          SizedBox(height: 5),
          TimePickerSpinner(
            locale: Locale('en', 'ar'),
            is24HourMode: false,
            normalTextStyle: TextStyles.sf40016.copyWith(
              color: AppPalette.blackLight2,
            ),
            highlightedTextStyle: TextStyles.sf40016.copyWith(
              color: AppPalette.blackLight2,
            ),
            spacing: 30,
            itemHeight: 50,
            isForce2Digits: true,
            onTimeChange: (time) {
              // bloc.add(GetTimeEvent(time: time));
            },
          ),
        ],
      ).asGlass(),
    );
  }
}
