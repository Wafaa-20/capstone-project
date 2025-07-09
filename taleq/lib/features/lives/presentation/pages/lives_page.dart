import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/widget/loading_widget.dart';
import 'package:taleq/features/lives/presentation/bloc/lives_bloc.dart';
import 'package:taleq/features/lives/presentation/bloc/lives_event.dart';
import 'package:taleq/features/lives/presentation/bloc/lives_state.dart';

class LivesPage extends StatelessWidget {
  final int userID;
  final String token;
  final String channelName;
  final String hostID;
  final bool isBrodcaster;

  const LivesPage({
    super.key,
    required this.userID,
    required this.token,
    required this.channelName,
    required this.hostID,
    required this.isBrodcaster,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LivesBloc>().add(
        InitLivesAgoraEvent(
          channelName: channelName,
          token: token,
          userID: userID,
          hostID: hostID,
          isBrodcaster: isBrodcaster,
        ),
      );
    });

    return BlocBuilder<LivesBloc, LivesState>(
      builder: (context, state) {
        if (state is LivesLoading) {
          return const Center(child: LoadingWidget());
        } else if (state is LivesRunning) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Lives Video'),
              leading: IconButton(
                onPressed: () {
                  context.read<LivesBloc>().add(LeaveLivesEvent());
                  context.go('/navigation');
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: SafeArea(
              child: Center(
                child: SizedBox(
                  width: context.getWidth(),
                  height: context.getHeight(),
                  child: state.isHost
                      ? state.agoraService.localView()
                      : state.agoraService.remoteView(
                          state.hostUID,
                          channelName,
                        ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
