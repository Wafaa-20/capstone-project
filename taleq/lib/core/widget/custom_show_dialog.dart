import 'package:flutter/cupertino.dart';
import 'package:taleq/core/extension/navigation.dart';

class CustomCupertinoDialog {
  static Future<void> show({
    required BuildContext context,
    required BuildContext blocContext,
    required String text,
    required String text2,
    required VoidCallback onPressed,
    Widget? title,
    required Widget content,
  }) async {
    await showCupertinoDialog(
      context: context,

      // barrierColor: Colors.transparent,
      builder: (_) {
        return CupertinoAlertDialog(
          title: title,
          content: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 700),
            child: content,
          ),

          actions: [
            CupertinoDialogAction(
              onPressed: () {
                context.customPop();
              },
              child: Text(text),
            ),

            // SizedBox(width: 15),
            CupertinoDialogAction(onPressed: onPressed, child: Text(text2)),
          ],
        );
      },
    );
  }
}
