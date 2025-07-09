import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
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
              itemCount: state.specialistList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppPalette.bluePrimary,
                        width: 3,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(state.specialistList[index].image),
                    ),

                    // backgroundImage: NetworkImage("")
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
