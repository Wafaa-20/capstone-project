import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_state.dart';
import 'package:taleq/features/groups/presentation/pages/available_group.dart';
import 'package:taleq/features/groups/presentation/widgets/group_card.dart';

class HorzintalSpaces extends StatelessWidget {
  const HorzintalSpaces({super.key, required this.bloc});
  final GroupsBloc bloc;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: context.getHeight() * 0.19,
        width: context.getWidth(),
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<GroupsBloc, GroupsState>(
                builder: (context, state) {
                  if (state is SpacesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetSuccees) {
                    final userSpaces = state.userSpaces ?? [];

                    if (userSpaces.isEmpty) {
                      return Center(child: Text("لا توجد مساحات متاحة"));
                    }

                    return Padding(
                      padding: EdgeInsets.only(
                        right: context.getWidth() * 0.05,
                      ),
                      child: SizedBox(
                        height: context.getHeight() * 0.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: userSpaces.length,
                          itemBuilder: (context, index) {
                            final userSpace = userSpaces[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.getWidth() * 0.01,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GroupCard(
                                  height: context.getHeight() * 0.15,
                                  width: context.getWidth() * 0.85,
                                  title: userSpace.title,
                                  date: bloc.formatDate(
                                    userSpace.startDate,
                                    userSpace.endDate,
                                  ),
                                  icon: userSpace.isActive
                                      ? Icons.wifi_tethering
                                      : Icons.access_time,
                                  onPressed: () {
                                    context.customPush(
                                      AvailableGroup(spaceId: userSpace.id),
                                    );
                                  },
                                  showButton: userSpace.isActive ? true : false,
                                  background: AppPalette.whiteLight,
                                  avatars: userSpace.avatars,
                                  showLeftIcon: false,
                                  usersCount: userSpace.usersCount,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is GetFalid) {
                    return Center(child: Text("Check Your Connetcion"));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            SizedBox(width: context.getWidth() * 0.01),
          ],
        ),
      ),
    );
  }
}
