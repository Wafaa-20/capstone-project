import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/loading_widget.dart';
import 'package:taleq/features/space/presentation/bloc/space_bloc.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';
import 'package:taleq/features/space/presentation/widgets/comments_bottom_sheet.dart';

class SpacePage extends StatelessWidget {
  final String userID;
  final String token;
  final String spaceID;
  final String hostID;

  const SpacePage({
    super.key,
    required this.userID,
    required this.token,
    required this.spaceID,
    required this.hostID,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SpaceBloc>().add(
        GetSpaceLists(spaceID: spaceID, userID: userID, token: token),
      );
    });
    return BlocBuilder<SpaceBloc, SpaceState>(
      builder: (context, state) {
        if (state is SpaceLoading) {
          return const Center(child: LoadingWidget());
        } else if (state is GetSpaceSuccess) {
          if (!state.isAgoraInitialized) {
            context.read<SpaceBloc>().add(
              InitAgoraEvent(
                channelName: state.getSpaceinfo.channelName,
                token: token,
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(state.getSpaceinfo.name),
              leading: IconButton(
                onPressed: () {
                  context.read<SpaceBloc>().add(
                    LeaveSpaceEvent(userID: userID, spaceID: spaceID),
                  );
                  context.go('/navigation');
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildUsersGrid(context, state.getspaceusers),
                  const Spacer(),
                  buildBottomBar(context, state.getSpaceinfo.comments),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildUsersGrid(BuildContext context, List users) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: users.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final user = users[index];
          final image = user['avatar_url'] ?? user['image'];
          final name = user['name'] ?? 'بدون اسم';
          final isMuted = user['is_muted'] ?? true;
          isMuted ? log('true mute') : log('false mute');
          // final iconUserID = user['user_id'];

          return Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: image != null ? NetworkImage(image) : null,
                    backgroundColor: Colors.grey.shade300,
                    child: image == null
                        ? const Icon(Icons.person, size: 36)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: AppPalette.whiteLight,
                      child: Icon(
                        isMuted ? Icons.mic_off : Icons.mic,
                        color: isMuted ? Colors.grey : Colors.blue,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(name, overflow: TextOverflow.ellipsis),
            ],
          );
        },
      ),
    );
  }

  Widget buildBottomBar(
    BuildContext context,
    List<Map<String, dynamic>> comments,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () =>
                context.read<SpaceBloc>().add(ToggleMicEvent(userID: userID)),
            icon: const Icon(Icons.mic, color: Colors.white),
            label: const Text("اضغط للتحدث"),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppPalette.whitePrimary,
              backgroundColor: AppPalette.bluePrimary,
            ),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share),
                label: Text(""),
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppPalette.black,
                  backgroundColor: AppPalette.whiteLight,
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    isScrollControlled: true,
                    builder: (ctx) => BlocProvider.value(
                      value: context.read<SpaceBloc>(),
                      child: CommentsBottomSheet(
                        currentUserId: userID,
                        currentSpaceId: spaceID,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.chat_bubble_outline),
                label: Text(comments.length.toString()),
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppPalette.black,
                  backgroundColor: AppPalette.whiteLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
