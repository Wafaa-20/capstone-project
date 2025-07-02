import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/theme/app_theme.dart';
import 'package:taleq/features/plan/data/models/plan_details/plan_details_model.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_bloc.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_event.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_state.dart';
import 'package:taleq/features/plan/presentation/widgets/plan_widget.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlanBloc>();
    Color stepColor(int index, {Color? color}) {
      if (index < bloc.currentIndex) {
        return color ?? AppPalette.greenSuccess;
      } else if (index == bloc.currentIndex) {
        return planDetails[index].color;
      } else {
        return color ?? AppPalette.greyLight;
      }
    }

    return BlocBuilder<PlanBloc, PlanState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Timeline.tileBuilder(
            theme: AppTheme.timelineTheme,
            controller: bloc.controller,
            builder: TimelineTileBuilder.connected(
              itemCount: planDetails.length,
              connectionDirection: ConnectionDirection.after,
              connectorBuilder: (context, index, connectorType) {
                return DashedLineConnector(
                  color: stepColor(index),
                  dash: 4,
                  gap: 6,
                  thickness: 2,
                );
              },

              indicatorBuilder: (context, index) {
                return DotIndicator(
                  size: 24,
                  color: stepColor(index),
                  child: index < bloc.currentIndex
                      ? Icon(Icons.check, color: Colors.white, size: 16)
                      : SizedBox(),
                );
              },

              //Content of TimeLine Is here
              contentsBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.all(24),
                child: PlanWidget(
                  detail: planDetails[index],
                  index: index,
                  containerColor: stepColor(
                    index,
                    color: AppPalette.whiteLight,
                  ),
                  onPressed: () {
                    //    ctx.go(planDetails[index].route);
                    bloc.add(SelectExerciseEvent(currentExercise: index));
                    bloc.controller.animateTo(
                      index * 150, // تقريبًا حسب حجم العنصر
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  bloc: bloc,
                ),
              ),

              nodePositionBuilder: (_, __) => 0.0,
            ),
          ),
        );
      },
    );
  }
}
