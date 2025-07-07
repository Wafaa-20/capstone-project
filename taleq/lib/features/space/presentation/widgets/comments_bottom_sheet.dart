import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/space/presentation/bloc/space_bloc.dart';
import 'package:taleq/features/space/presentation/bloc/space_event.dart';
import 'package:taleq/features/space/presentation/bloc/space_state.dart';

class CommentsBottomSheet extends StatefulWidget {
  final String currentUserId;
  final String currentSpaceId;

  const CommentsBottomSheet({
    super.key,

    required this.currentUserId,
    required this.currentSpaceId,
  });

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void sendComment() {
    final text = commentController.text.trim();
    if (text.isNotEmpty) {
      final bloc = context.read<SpaceBloc>();
      final currentState = bloc.state;
      if (currentState is GetSpaceSuccess) {
        bloc.add(
          AddCommentEvent(
            commentText: text,
            spaceID: widget.currentSpaceId,
            userID: widget.currentUserId,
          ),
        );
        commentController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'التعليقات',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SpaceBloc, SpaceState>(
              builder: (context, state) {
                if (state is GetSpaceSuccess) {
                  final comments = state.getSpaceinfo.comments;

                  return ListView.builder(
                    reverse: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[comments.length - 1 - index];

                      final isMe = comment['userID'] == widget.currentUserId;

                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMe
                                ? Colors.blue.shade100
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment['userName'] ?? 'مجهول',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(comment['message'] ?? ''),
                              const SizedBox(height: 2),
                              Text(
                                _formatDate(comment['sent_at']),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: 'اكتب تعليقاً...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onSubmitted: (_) => sendComment(),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => sendComment(),
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(dynamic date) {
    try {
      final sentAt = DateTime.parse(date.toString()).toLocal();
      return '${sentAt.hour.toString().padLeft(2, '0')}:${sentAt.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return '';
    }
  }
}
