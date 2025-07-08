import 'package:flutter/material.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(AppText.ar, style: TextStyles.sf50016),
          leading: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/image/ar.png'),
          ),
          onTap: () {
            //   .add(const ChangeLanguageEvent(localeCode: 'ar'));
            context.customPop();
          },
        ),
        const Divider(height: 2, thickness: 2, color: AppPalette.bluePrimary),
        ListTile(
          title: Text(AppText.en, style: TextStyles.sf50016),
          leading: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/image/en.png'),
          ),
          onTap: () {
            //   .add(const ChangeLanguageEvent(localeCode: 'en'));
            context.customPop();
          },
        ),
      ],
    );
  }
}
