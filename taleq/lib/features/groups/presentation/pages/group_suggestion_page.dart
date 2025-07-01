import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_event.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_state.dart';

class GroupSuggestionPage extends StatelessWidget {
  const GroupSuggestionPage({super.key, required this.bloc});
  final GroupsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    context.customPop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                ),
              ),
              Text(
                AppText.groupSuggestionTitle,
                style: TextStyles.sf70018.copyWith(color: AppPalette.black),
              ),
              const SizedBox(height: 8),
              Text(
                AppText.groupSuggestionSubTitle,
                style: TextStyles.sf40014.copyWith(
                  color: AppPalette.grayPrimary,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: bloc.title,
                hintText: AppText.suggestTitle.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/icon/edit-line.svg"),
                ),
                onChanged: (value) {
                  bloc.add(TitleChanged(value));
                },
              ),
              CustomTextField(
                controller: bloc.details,
                hintText: AppText.extraDetail.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/icon/edit-line.svg"),
                ),
              ),
              const Spacer(),

              BlocBuilder<GroupsBloc, GroupsState>(
                bloc: bloc,
                builder: (context, state) {
                  return state.showButton
                      ? CustomButton(
                          width: context.getWidth(),
                          onPressed: () {},
                          child: Text(
                            AppText.suggestGroup.tr(),
                            style: TextStyles.sf60020.copyWith(
                              color: AppPalette.whiteLight,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
