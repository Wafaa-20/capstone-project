import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/theme/app_theme.dart';
import 'package:taleq/features/plan/data/models/plan_details/plan_details_model.dart';
import 'package:taleq/features/plan/presentation/widgets/plan_widget.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    // int activeStep = 1;
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Timeline.tileBuilder(
        theme: AppTheme.timelineTheme,
        builder: TimelineTileBuilder.connected(
          itemCount: 4,
          connectionDirection: ConnectionDirection.after,
          connectorBuilder: (_, index, __) {
            return
            // index < activeStep
            //     ? SolidLineConnector(color: Colors.green, thickness: 2)
            DashedLineConnector(
              color: planDetails[index].color,
              dash: 4,
              gap: 6,
              thickness: 2,
            );
          },

          indicatorBuilder: (_, index) {
            return DotIndicator(
              size: 24,
              color: planDetails[index].color,
              child: Icon(Icons.check, color: Colors.white, size: 16),
            );
          },

          //Content of TimeLine Is here
          contentsBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.all(24),
            child: PlanWidget(
              detail: planDetails[index],
              color: planDetails[index].color,
              onPressed: () => ctx.go(planDetails[index].route),
            ),
          ),

          nodePositionBuilder: (_, __) => 0.0,
        ),
      ),
    );
  }
}
