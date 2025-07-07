import 'package:flutter/material.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';

class CustomShowDialog {
  static Future<void> show({
    required BuildContext context,
    required BuildContext blocContext,
    required String text,
    required VoidCallback onPressed,
    Widget? title,
    required Widget content,
  }) async {
    await showDialog(
      context: context,

      builder: (_) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: AppPalette.bluePrimary,
          title: title,
          content: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 700, minHeight: 100),
            child: content,
          ),

          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    context.customPop();
                  },
                  height: 48,
                  width: 153,
                  color: AppPalette.bluePrimary,
                  child: Text(AppText.back, style: TextStyles.sf40018),
                ),
                SizedBox(width: 15),
              
                CustomButton(
                  onPressed: onPressed,
                  height: 48,
                  width: 153,
                  child: Text(text, style: TextStyles.sf40016),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
