import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_event.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_state.dart';
import 'package:taleq/features/groups/presentation/pages/available_group.dart';
import 'package:taleq/features/groups/presentation/pages/group_suggestion_page.dart';
import 'package:taleq/features/groups/presentation/widgets/group_card.dart';
import 'package:taleq/features/groups/presentation/widgets/horzintal_spaces.dart';
import 'package:taleq/features/groups/presentation/widgets/vertical_spaces.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GroupsBloc>(),

      child: Builder(
        builder: (context) {
          final bloc = context.read<GroupsBloc>()..add(GetSpaces());
          return Scaffold(
            appBar: AppBar(
              title: Text(AppText.groupTitle.tr()),
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                child: SvgPicture.asset(
                  "assets/image/4.svg",
                  colorFilter: ColorFilter.mode(
                    AppPalette.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/image/search.svg"),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: GestureDetector(
                        onTap: () {
                          context.customPush(GroupSuggestionPage(bloc: bloc));
                        },
                        child: GroupCard(
                          height: 59,
                          width: 450,
                          title: AppText.addGroup.tr(),
                          showButton: false,
                          showBorder: true,
                          borderColor: AppPalette.bluePrimary,
                          background: AppPalette.blueGroup,
                        ),
                      ),
                    ),
                    Text(
                      AppText.myGroup.tr(),
                      style: TextStyles.sf50016.copyWith(
                        color: AppPalette.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    HorzintalSpaces(bloc: bloc),
                    SizedBox(height: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(
                            AppText.avilableGroup.tr(),
                            style: TextStyles.sf50016.copyWith(
                              color: AppPalette.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          VerticalSpaces(bloc: bloc),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
