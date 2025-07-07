import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/service/agora.dart';
import 'package:taleq/features/space/presentation/bloc/space_bloc.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';
import 'package:taleq/features/space/presentation/widgets/comments_bottom_sheet.dart';

class SpacePage extends StatefulWidget {
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
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  final agoraService = AgoraService();
  bool isAgoraInitialized = false;
  bool isMicEnabled = true;

  @override
  void initState() {
    super.initState();

    context.read<SpaceBloc>().add(
      GetSpaceLists(
        userID: widget.userID,
        token: widget.token,
        spaceID: widget.spaceID,
      ),
    );
  }

  Future<void> _initAgora(String channelName) async {
    await agoraService.initWithUserAccount(
      appId: '59fd63f1b8fa4761b7900a1d9bc8992b',
      token: widget.token,
      channelName: channelName,
      userAccount: widget.userID,
    );
    setState(() => isAgoraInitialized = true);
  }

  void toggleMic() {
    if (isMicEnabled) {
      agoraService.muteLocalMic();
    } else {
      agoraService.unmuteLocalMic();
    }
    setState(() {
      isMicEnabled = !isMicEnabled;
    });
  }

  @override
  void dispose() {
    agoraService.leave();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceBloc, SpaceState>(
      builder: (context, state) {
        if (state is SpaceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetSpaceSuccess) {
          final spaceInfo = state.getSpaceinfo;
          final users = state.getspaceusers;

          if (!isAgoraInitialized) {
            _initAgora(spaceInfo.channelName);
          }

          return buildSpaceUI(spaceInfo.name, users, spaceInfo.comments);
        } else if (state is GetSpaceFiled) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildSpaceUI(
    String spaceName,
    List users,
    List<Map<String, dynamic>> comments,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spaceName, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            buildUsersGrid(users),
            const Spacer(),
            buildBottomBar(comments),
          ],
        ),
      ),
    );
  }

  Widget buildUsersGrid(List users) {
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
          final isSpeaking = user['isSpeaking'] ?? false;
          final isMuted = user['isMuted'] ?? false;

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
                    child: GestureDetector(
                      onTap: toggleMic,
                      child: Icon(
                        isMicEnabled ? Icons.mic : Icons.mic_off,
                        color: isMicEnabled ? Colors.blue : Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),
              Text(
                name,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBottomBar(List<Map<String, dynamic>> comments) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      builder: (ctx) => BlocProvider.value(
                        value: context.read<SpaceBloc>(),
                        child: CommentsBottomSheet(
                          currentUserId: widget.userID,
                          currentSpaceId: widget.spaceID,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.chat_bubble_outline),
                ),
              ),
              Text(comments.length.toString()),
              const SizedBox(width: 12),
              const Icon(Icons.share),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              agoraService.unmuteLocalMic();
            },
            icon: const Icon(Icons.mic, color: Colors.white),
            label: const Text("طلب التحدث"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
