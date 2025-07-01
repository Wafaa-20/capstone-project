import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/groups/presentation/pages/available_group.dart';
import 'package:taleq/features/groups/presentation/pages/group_suggestion_page.dart';
import 'package:taleq/features/groups/presentation/widgets/group_card.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupsBloc(),

      child: Builder(
        builder: (context) {
          final bloc = context.read<GroupsBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(AppText.groupTitle.tr()),
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                child: SvgPicture.asset(
                  "assets/image/4.svg",
                  colorFilter: ColorFilter.mode(
                    AppPalette.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/image/search.svg"),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: GestureDetector(
                        onTap: () {
                          context.customPush(GroupSuggestionPage(bloc: bloc));
                        },
                        child: GroupCard(
                          height: 59,
                          width: 450,
                          title: AppText.addGroup.tr(),
                          showRightIcon: true,
                          icon: Icons.keyboard_arrow_left_rounded,
                          showButton: false,
                          showBorder: true,
                          showLeftIcon: false,
                          borderColor: AppPalette.bluePrimary,
                          background: AppPalette.blueGroup,
                          onPressed: () {
                            context.customPush(AvailableGroup());
                          },
                        ),
                      ),
                    ),
                    Text(
                      AppText.myGroup.tr(),
                      style: TextStyles.sf50016.copyWith(
                        color: AppPalette.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: GroupCard(
                              height: 93,
                              width: 261,
                              title: AppText.story.tr(),
                              date: AppText.now.tr(),
                              icon: Icons.wifi_tethering,
                              showButton: false,
                              avatars: [
                                "assets/image/doctor1.png",
                                "assets/image/doctor1.png",
                                "assets/image/doctor1.png",
                              ],
                              background: AppPalette.whiteLight,
                            ),
                          ),
                          SizedBox(width: 18),
                          GestureDetector(
                            onTap: () {},
                            child: GroupCard(
                              height: 93,
                              width: 261,
                              title: AppText.talkFree.tr(),
                              date: AppText.groupDate1.tr(),
                              icon: Icons.access_time,
                              showButton: false,
                              background: AppPalette.whiteLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(
                            AppText.avilableGroup.tr(),
                            style: TextStyles.sf50016.copyWith(
                              color: AppPalette.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          GroupCard(
                            height: 104,
                            width: 380,
                            title: AppText.groupTitle1.tr(),
                            date: AppText.groupDate1.tr(),
                            icon: Icons.access_time,
                            onPressed: () {
                              context.customPush(AvailableGroup());
                            },
                            showButton: true,
                            background: AppPalette.whiteLight,
                          ),
                          GroupCard(
                            height: 104,
                            width: 380,
                            title: AppText.groupTitle2.tr(),
                            date: AppText.groupDate2.tr(),
                            icon: Icons.access_time,
                            showButton: true,
                            onPressed: () {
                              context.customPush(AvailableGroup());
                            },
                            background: AppPalette.whiteLight,
                          ),
                          GroupCard(
                            height: 104,
                            width: 380,
                            title: AppText.groupTitle3.tr(),
                            date: AppText.groupDate2.tr(),
                            icon: Icons.access_time,
                            showButton: true,
                            onPressed: () {
                              context.customPush(AvailableGroup());
                            },
                            background: AppPalette.whiteLight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
