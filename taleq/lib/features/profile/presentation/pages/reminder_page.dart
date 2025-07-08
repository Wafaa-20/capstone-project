import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/core/widget/button/custom_text_button.dart';
import 'package:taleq/core/widget/custom_bottom_sheet.dart';
import 'package:taleq/features/profile/presentation/widgets/time_picker.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => context.customPop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(AppText.reminderTitle, style: TextStyles.sf60018),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              AppText.reminderSubtitle,
              style: TextStyles.sf40016.copyWith(color: AppPalette.black),
            ),
            SizedBox(height: 70),
            Image.asset("assets/image/reminder.png", height: 185, width: 185),
            SizedBox(height: 70),
            CustomButton(
              color: AppPalette.whiteLight,
              height: 52,
              width: 134,
              onPressed: () {
                customBottomSheet(context, height: 220, TimePicker());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/image/time.png",
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                  Text("2:30", style: TextStyles.sf40016),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: AppPalette.black,
                  ),
                ],
              ),
            ),

            SizedBox(height: 115),

            CustomButton(
              onPressed: () {},
              width: context.getWidth(),
              child: Text(AppText.reminder, style: TextStyles.sf70020),
            ),
            SizedBox(height: 15),
            CustomTextButton(
              onPressed: () {},
              text: AppText.notNow,
              styles: TextStyles.sf40016,
            ),
          ],
        ),
      ),
    );
  }
}
