import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/inspiring_stories_widget.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 31),
        Text("""إخصائي نطق وتخاطب معتمد.
    خبرة تزيد عن 5 سنوات في علاج اضطرابات النطق والتأتأة.
    متخصص في تصميم خطط علاجية مخصصة لكل مريض."""),

        SizedBox(height: 120),
        Text(
          AppText.assessment,
          style: TextStyles.sf40016.copyWith(color: AppPalette.black),
        ),
        SizedBox(height: 8),
        InspiringStoriesWidget(avatar: '', name: '', title: '', story: ''),
      ],
    );
  }
}
