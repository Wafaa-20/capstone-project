import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/core/widget/loading_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Text(
                AppText.comments.tr(),
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
                          final isMe =
                              comment['userID'] == widget.currentUserId;

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
                                    comment['userName'] ??
                                        AppText.anonymous.tr(),
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
                    return const Center(child: LoadingWidget());
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: BlocListener<SpaceBloc, SpaceState>(
                      listener: (context, state) {
                        if (state is GetSpaceSuccess) {
                          commentController.clear();
                        }
                      },
                      child: CustomTextField(
                        controller: commentController,
                        hintText: AppText.leaveComment.tr(),
                        onSubmitted: (_) => _sendComment(context),
                        suffixIcon: IconButton(
                          onPressed: () => _sendComment(context),
                          icon: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 13),
            ],
          ),
        ),
      ),
    );
  }

  void _sendComment(BuildContext context) {
    final text = commentController.text.trim();
    if (text.isNotEmpty) {
      context.read<SpaceBloc>().add(
        AddCommentEvent(
          commentText: text,
          spaceID: widget.currentSpaceId,
          userID: widget.currentUserId,
        ),
      );
    }
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
