import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/groups/presentation/widgets/group_card.dart';

class AvailableGroup extends StatelessWidget {
  const AvailableGroup({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> texts = {
      "name": "رحلة التعافي",
      "number_of_seats": "3 مقاعد متبقية",
      "number_of_pepole": "10 أشخاص",
      "date": "18 - 22 فبراير",
      // "start_date": "18",
      // "end_date": "22",
      "description": "مساحة ملهمة لمشاركة التجارب في رحلة التغلب على التأتأة.",
      "goals": [
        "تبادل الخبرات",
        "الهام وتحفيز الاعضاء",
        "بناء مجتمع داعم",
        "تعزيز وتطوير الذات",
      ],
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              context.customPop();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 30,
                            ),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          ),
                        ),
                      ],
                    ),
                    GroupCard(
                      height: 100,
                      width: 361,
                      background: AppPalette.blueGroup,
                      showButton: false,
                      title: texts["name".tr()],
                      titleAlignment: AlignmentDirectional(-0.9, 0.2),
                      titleStyle: TextStyles.sf70018.copyWith(
                        color: AppPalette.black,
                      ),
                      backgroundImage: const DecorationImage(
                        image: AssetImage("assets/image/tabler_butterfly.png"),
                        alignment: Alignment(-0.5, -0.35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GroupCard(
                            height: 86,
                            width: 113,
                            title: texts["date".tr()],
                            icon: Icons.access_time_outlined,
                            background: AppPalette.whiteLight,
                            iconOnTop: true,
                            showDate: false,
                            showButton: false,
                            titleStyle: TextStyles.sf30014.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GroupCard(
                            height: 86,
                            width: 113,
                            title: texts["number_of_pepole".tr()],
                            icon: Icons.groups,
                            background: AppPalette.whiteLight,
                            iconOnTop: true,
                            showDate: false,
                            showButton: false,
                            titleStyle: TextStyles.sf30014.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GroupCard(
                            height: 86,
                            width: 113,
                            title: texts["number_of_seats".tr()],
                            icon: Icons.event_seat,
                            background: AppPalette.whiteLight,
                            iconOnTop: true,
                            showDate: false,
                            showButton: false,
                            titleStyle: TextStyles.sf30014.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    GroupCard(
                      height: 55,
                      width: 364,
                      title: AppText.groupDec.tr(),
                      showButton: false,
                      showLeftIcon: false,
                      background: AppPalette.blueGroup,
                      titleStyle: TextStyles.sf70016.copyWith(
                        color: AppPalette.black,
                      ),
                    ),
                    Text(texts["description"], style: TextStyles.sf50014),
                    const SizedBox(height: 12),
                    GroupCard(
                      height: 55,
                      width: 364,
                      title: AppText.groupGole.tr(),
                      showButton: false,
                      showLeftIcon: false,
                      background: AppPalette.blueGroup,
                      titleStyle: TextStyles.sf70016.copyWith(
                        color: AppPalette.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        texts["goals".tr()].length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "• ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppPalette.bluePrimary,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    texts["goals".tr()][index],
                                    style: TextStyles.sf50014,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomButton(
                height: 44,
                width: 365,
                onPressed: () {},
                child: Text(
                  AppText.joinGroup.tr(),
                  style: TextStyles.sf60020.copyWith(
                    color: AppPalette.whiteLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
