import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/service/agora.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/space/domain/usecases/get_space.dart';
import 'package:taleq/features/space/presentation/bloc/space_bloc.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';
import 'package:taleq/features/space/presentation/widgets/CommentsBottomSheet.dart';

class SpacePage extends StatefulWidget {
  final String userID;
  final String token;
  final String spaceID;

  const SpacePage({
    super.key,
    required this.userID,
    required this.token,
    required this.spaceID,
  });

  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  final agoraService = AgoraService();
  bool isAgoraInitialized = false;
  final TextEditingController _commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    agoraService.leave();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SpaceBloc>()
        ..add(
          GetSpaceLists(
            userID: widget.userID,
            token: widget.token,
            spaceID: widget.spaceID,
          ),
        ),
      child: BlocBuilder<SpaceBloc, SpaceState>(
        builder: (context, state) {
          if (state is SpaceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetSpaceSuccess) {
            final spaceInfo = state.getSpaceinfo;
            final users = state.getspaceusers;

            if (!isAgoraInitialized) {
              _initAgora(spaceInfo.channelName);
            }

            return buildSpaceUI(spaceInfo, users, state);
          } else if (state is GetSpaceFiled) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildSpaceUI(spaceInfo, users, GetSpaceSuccess state) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            spaceInfo.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            buildUsersGrid(users),
            buildCommentsPreview(spaceInfo.comments),
            const Spacer(),
            buildBottomBar(state),
          ],
        ),
      ),
    );
  }

  Widget buildUsersGrid(users) => Padding(
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
        final String? image = user['avatar_url'] ?? user['image'];
        final String name = user['name'] ?? 'بدون اسم';
        final bool isSpeaking = user['isSpeaking'] ?? false;
        final bool isMuted = user['isMuted'] ?? false;

        return Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage: image != null ? NetworkImage(image) : null,
                  child: image == null
                      ? const Icon(Icons.person, size: 36)
                      : null,
                ),
                if (isSpeaking || isMuted)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        isMuted ? Icons.mic_off : Icons.graphic_eq,
                        color: isMuted ? Colors.grey : Colors.blue,
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
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    ),
  );

  buildBottomBar(GetSpaceSuccess state) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) => CommentsBottomSheet(
                            comments: state.getSpaceinfo.comments,
                          ),
                        );
                      },
                      icon: Icon(Icons.chat_bubble_outline),
                    ),
                    Text(state.getSpaceinfo.comments.length.toString()),
                  ],
                ),
                const SizedBox(width: 12),
                _iconWithLabel(Icons.share, ""),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.mic, color: AppPalette.whiteLight),
              label: Text("طلب التحدث", style: TextStyles.sf70020),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'leave a comment ...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendComment(),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _sendComment,

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Icon(Icons.send),
            ),
          ],
        ),
      ],
    ),
  );
  Widget buildCommentsPreview(List<Map<String, dynamic>> comments) {
    if (comments.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text('لا توجد تعليقات بعد'),
      );
    }

    final lastComments = comments.length <= 3
        ? comments
        : comments.sublist(comments.length - 3);

    return Column(
      children: lastComments.map((comment) {
        return ListTile(
          leading: const Icon(Icons.person_outline),
          title: Text(comment['user'] ?? 'مجهول'),
          subtitle: Text(comment['message'] ?? ''),
          trailing: Text(
            comment['sent_at']?.toString().split('T').first ?? '',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        );
      }).toList(),
    );
  }

  void _sendComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      context.read<SpaceBloc>().add(AddCommentEvent(commentText: text));

      _commentController.clear();
    }
  }

  Widget _iconWithLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        if (label.isNotEmpty) ...[const SizedBox(width: 4), Text(label)],
      ],
    );
  }
}
