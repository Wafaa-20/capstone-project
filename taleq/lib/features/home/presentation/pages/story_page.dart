import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("قصتك")),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            CustomTextField(controller: controller),
            TextField(
              // controller: _storyController,
              decoration: InputDecoration(
                hintText: 'اكتب قصتك هنا',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null, // يسمح بعدد أسطر غير محدود
              minLines: 5, // يبدأ بخمس أسطر مثلاً
            ),
            CustomButton(
              width: context.getWidth(),
              onPressed: () {},
              child: Text(
                AppText.shareStory2,
                style: TextStyles.sf70020.copyWith(
                  // color: AppPalette.whitePrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
