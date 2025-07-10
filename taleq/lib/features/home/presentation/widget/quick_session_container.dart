import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';

class QuickSessionContainer extends StatelessWidget {
  const QuickSessionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      height: 150,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: AppPalette.bluePrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            bottom: -10,
            left: -12,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 99,
                width: 99,
                child: Image.asset(
                  'assets/image/specialists.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          Positioned(
            top: 30,
            left: 50,
            child: CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage('assets/image/doctor1.png'),
            ),
          ),
          Positioned(
            top: -2,
            left: 20,
            child: CircleAvatar(
              radius: 26,
              backgroundColor: AppPalette.whitePrimary,
              child: Image.asset('assets/image/doctor2.png', fit: BoxFit.cover),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              Text(
                AppText.needFollowUp,
                style: TextStyles.sf60016.copyWith(
                  color: AppPalette.whitePrimary,
                ),
              ),
              SizedBox(height: 7),
              Text(
                AppText.followUpDetails,
                style: TextStyles.sf40014.copyWith(
                  color: AppPalette.whitePrimary,
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                height: 10,
                width: 76,
                radius: 15,
                color: AppPalette.whiteLight,
                onPressed: () {
                  context.go('/specialists');
                },
                child: Text(
                  AppText.bookNow,
                  style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
