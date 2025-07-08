import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/plan/data/models/plan_details/plan_details_model.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_bloc.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({
    super.key,
    required this.detail,
    this.onPressed,
    required this.containerColor,
    required this.index,
    required this.bloc,
  });
  final PlanDetailsModel detail;
  final void Function()? onPressed;
  final Color containerColor;
  final int index;
  final PlanBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 100,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: containerColor,
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
              colorFilter: index < bloc.currentIndex
                  ? ColorFilter.mode(
                      AppPalette.greenTransparent,
                      BlendMode.srcIn,
                    )
                  : index > bloc.currentIndex
                  ? ColorFilter.mode(AppPalette.grayLight, BlendMode.srcIn)
                  : null,
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
                    color: index == bloc.currentIndex
                        ? AppPalette.whitePrimary
                        : AppPalette.black,
                  ),
                ),
                Text(
                  detail.description,
                  style: TextStyles.sf40014.copyWith(
                    color: index == bloc.currentIndex
                        ? null
                        : AppPalette.grayPrimary,
                  ),

                  maxLines: 3,
                ),
              ],
            ),
          ),
          Positioned(
            top: 53,
            left: 15,
            child:
                // index == bloc.currentIndex
                CustomButton(
                  width: 72,
                  height: 2,
                  color: AppPalette.whiteLight,
                  sideColor: AppPalette.whiteLight,
                  onPressed: onPressed,
                  child: Text(
                    AppText.start.tr(),
                    style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                  ),
                ),
            // : SizedBox(),
          ),
        ],
      ),
    );
  }
}
