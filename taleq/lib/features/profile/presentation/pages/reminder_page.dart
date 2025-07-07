import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_text_button.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
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
