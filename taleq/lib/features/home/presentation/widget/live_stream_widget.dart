import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/loading_widget.dart';
import 'package:taleq/features/home/domain/entities/home_entity.dart';

import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/home/presentation/bloc/home_event.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';

class LiveStreamWidget extends StatelessWidget {
  const LiveStreamWidget({super.key, required this.bloc});
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is GetSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.homeList.specialists.length,
              itemBuilder: (BuildContext context, int index) {
                final bool isLive =
                    state.homeList.specialists[index].id.isNotEmpty &&
                    state.homeList.specialists[index].id != '';
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isLive
                            ? AppPalette.bluePrimary
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (isLive) {
                          bloc.add(
                            GoLiveEvent(
                              uid: state.homeList.specialists[index].id,
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                          state.homeList.specialists[index].image,
                        ),
                      ),
                    ),

                    // backgroundImage: NetworkImage("")
                  ),
                );
              },
            );
          } else if (state is GoLive) {
            final isBrodcaster = state.live.hostID == state.live.userAccount;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(
                '/lives?userID=${Uri.encodeComponent(state.live.intUserAccount.toString())}'
                '&token=${Uri.encodeComponent(state.live.token)}'
                '&channelName=${Uri.encodeComponent(state.live.channelName)}'
                '&isBrodcaster=${Uri.encodeComponent(isBrodcaster.toString())}'
                '&hostID=${Uri.encodeComponent(state.live.hostID)}',
              );
            });
          }

          return Center(child: LoadingWidget());
        },
      ),
    );
  }
}
