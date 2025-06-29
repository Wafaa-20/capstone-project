import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/plan/data/models/plan_details/plan_details_model.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({super.key, required this.color, required this.detail});
  final Color? color;
  final PlanDetailsModel detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 100,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        // clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: detail.top,
            left: detail.left,
            bottom: detail.bottom,
            right: detail.right,
            child: SvgPicture.asset(
              detail.image,
              width: detail.width,
              height: detail.height,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.title,
                  style: TextStyles.sf50016.copyWith(
                    color: AppPalette.whitePrimary,
                  ),
                ),
                Text(
                  detail.description,
                  style: TextStyles.sf40014,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          Positioned(
            top: 53,
            left: 15,
            child: CustomButton(
              width: 72,
              height: 2,
              color: AppPalette.whiteLight,
              sideColor: AppPalette.whiteLight,
              onPressed: () {},
              child: Text(
                AppText.start,
                style: TextStyles.sf40016.copyWith(color: AppPalette.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
