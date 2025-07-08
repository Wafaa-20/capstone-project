import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_state.dart';
import 'package:taleq/features/groups/presentation/pages/available_group.dart';
import 'package:taleq/features/groups/presentation/widgets/group_card.dart';

class VerticalSpaces extends StatelessWidget {
  const VerticalSpaces({super.key, required this.bloc});
  final GroupsBloc bloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsBloc, GroupsState>(
      builder: (context, state) {
        if (state is SpacesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetSuccees) {
          final availableSpaces = state.availableSpaces ?? [];

          if (availableSpaces.isEmpty) {
            return Center(child: Text("لا توجد مساحات متاحة"));
          }

          return Expanded(
            child: ListView.builder(
              itemCount: availableSpaces.length,
              itemBuilder: (context, index) {
                final availableSpace = availableSpaces[index];
                return Align(
                  alignment: Alignment.centerRight,
                  child: GroupCard(
                    height: context.getHeight() * 0.15,
                    width: context.getWidth() * 0.85,
                    title: availableSpace.title,
                    date: bloc.formatDate(
                      availableSpace.startDate,
                      availableSpace.endDate,
                    ),
                    icon: availableSpace.isActive
                        ? Icons.wifi_tethering
                        : Icons.access_time,
                    onPressed: () {
                      context.go(
                        '/avilable_group?spaceID=${availableSpace.id}',
                      );
                    },
                    showButton: availableSpace.isActive,
                    background: AppPalette.whiteLight,
                    avatars: availableSpace.avatars,
                    showLeftIcon: false,
                    usersCount: availableSpace.usersCount,
                  ),
                );
              },
            ),
          );
        } else if (state is GetFalid) {
          return Center(child: Text(AppText.networkError.tr()));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
