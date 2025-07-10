import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_bloc.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_state.dart';
import 'package:taleq/features/plan/presentation/widgets/custom_time_line.dart';
import 'package:taleq/features/plan/presentation/widgets/day_item_widget.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.homeAppBar.tr()),

        leading: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icon/Group.svg", fit: BoxFit.contain),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<PlanBloc, PlanState>(
            builder: (context, state) {
              if (state is QuestnereState) {
                context.go('/startQuestionnaire');
              }
              return SizedBox.shrink();
            },
          ),
          DayItemWidget(),
          Flexible(child: CustomTimeLine()),
        ],
      ),
    );
  }
}
