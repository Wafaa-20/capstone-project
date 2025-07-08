import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';

class InspiringStoriesWidget extends StatelessWidget {
  const InspiringStoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        height: 170,
        width: context.getWidth() * 0.79,
        decoration: BoxDecoration(
          color: AppPalette.greyBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                EditImageProfile(radius: 15),
                SizedBox(width: 9),
                Text("أحمد صالح", style: TextStyles.sf60014),

                Spacer(),
                Image.asset("assets/image/comment.png"),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '"التأتأة ليست نهاية الطريق"',
              style: TextStyles.sf60014.copyWith(color: AppPalette.black),
              textAlign: TextAlign.right,
            ),

            SizedBox(height: 3),
            Text(
              """
      منذ صغري كنت أخشى التحدث بسبب التأتأة. لكن قررت أتدرب كل يوم، بفضل الله، أصبحت أكثر شجاعة. اليوم، تعلمت أن التأتأة جزء مني، لكنها ما تحدد من أكون.""",
              style: TextStyles.sf40014.copyWith(color: AppPalette.blackLight),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
