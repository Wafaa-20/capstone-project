import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_event.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_state.dart';
import 'package:taleq/features/groups/presentation/widgets/group_card.dart';

class AvailableGroup extends StatelessWidget {
  const AvailableGroup({super.key, required this.spaceId});
  final String spaceId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<GroupsBloc>()..add(BringSpaceDetails(spaceId: spaceId)),
      child: Builder(
        builder: (context) {
          final GroupsBloc bloc = context.read<GroupsBloc>();
          return Scaffold(
            body: SafeArea(
              child: BlocBuilder<GroupsBloc, GroupsState>(
                builder: (context, state) {
                  if (state is SpacesLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SpaceDetailsFiled) {
                    return Center(child: Text(AppText.networkError.tr()));
                  } else if (state is SpaceDetailsSuccess) {
                    return Column(
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
                                          context.go('/navigation');
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 30,
                                        ),
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          10,
                                          0,
                                          20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GroupCard(
                                  height: 100,
                                  width: 361,
                                  background: AppPalette.blueGroup,
                                  showButton: false,
                                  title: state.spaceDetails.name,
                                  titleAlignment: AlignmentDirectional(
                                    -0.9,
                                    0.2,
                                  ),
                                  titleStyle: TextStyles.sf70018.copyWith(
                                    color: AppPalette.black,
                                  ),
                                  backgroundImage: const DecorationImage(
                                    image: AssetImage(
                                      "assets/image/tabler_butterfly.png",
                                    ),
                                    alignment: Alignment(-0.5, -0.35),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GroupCard(
                                        height: context.getHeight() * 0.115,
                                        width: context.getWidth() * 0.285,
                                        title: bloc.formatDetailsDate(
                                          state.spaceDetails.startDate,
                                          state.spaceDetails.endDate,
                                        ),
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
                                        height: context.getHeight() * 0.115,
                                        width: context.getWidth() * 0.285,
                                        title:
                                            '${state.spaceDetails.numberOfPepole.toString()} ${AppText.pepole.tr()}',
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
                                        height: context.getHeight() * 0.115,
                                        width: context.getWidth() * 0.285,
                                        title:
                                            '${state.spaceDetails.numberOfSeats.toString()} ${AppText.availableSeats.tr()}',
                                        icon: Icons.event_seat,
                                        background: AppPalette.whiteLight,
                                        iconOnTop: true,
                                        showDate: false,
                                        showButton: false,
                                        titleStyle: TextStyles.sf40016.copyWith(
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
                                Text(
                                  state.spaceDetails.description,
                                  style: TextStyles.sf50014,
                                ),
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
                                    state.spaceDetails.goals.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          20,
                                          0,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                state.spaceDetails.goals[index],
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
                            onPressed: () {
                              bloc.add(
                                JoinSpace(
                                  spaceID: state.spaceDetails.id,
                                  channelName: state.spaceDetails.channelName,
                                ),
                              );
                            },
                            child: Text(
                              AppText.joinGroup.tr(),
                              style: TextStyles.sf60020.copyWith(
                                color: AppPalette.whiteLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is JoinSuccees) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.go(
                        '/space?userID=${Uri.encodeComponent(state.userID)}'
                        '&token=${Uri.encodeComponent(state.token)}'
                        '&spaceID=${Uri.encodeComponent(spaceId)}'
                        '&hostID=${Uri.encodeComponent(state.hostID)}',
                      );
                    });
                  } else if (state is JoinFalid) {
                    return Center(child: Text(AppText.error.tr()));
                  }
                  return Column(
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
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        10,
                                        0,
                                        20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GroupCard(
                                height: 100,
                                width: 361,
                                background: AppPalette.blueGroup,
                                showButton: false,
                                title: "",
                                titleAlignment: AlignmentDirectional(-0.9, 0.2),
                                titleStyle: TextStyles.sf70018.copyWith(
                                  color: AppPalette.black,
                                ),
                                backgroundImage: const DecorationImage(
                                  image: AssetImage(
                                    "assets/image/tabler_butterfly.png",
                                  ),
                                  alignment: Alignment(-0.5, -0.35),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GroupCard(
                                      height: context.getHeight() * 0.115,
                                      width: context.getWidth() * 0.285,
                                      title: "",
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
                                      height: context.getHeight() * 0.115,
                                      width: context.getWidth() * 0.285,
                                      title: AppText.pepole.tr(),
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
                                      height: context.getHeight() * 0.115,
                                      width: context.getWidth() * 0.285,
                                      title: AppText.availableSeats.tr(),
                                      icon: Icons.event_seat,
                                      background: AppPalette.whiteLight,
                                      iconOnTop: true,
                                      showDate: false,
                                      showButton: false,
                                      titleStyle: TextStyles.sf40016.copyWith(
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
                              Text("", style: TextStyles.sf50014),
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
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
