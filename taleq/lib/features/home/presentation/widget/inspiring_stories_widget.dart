import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/loading_widget.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';

class InspiringStoriesWidget extends StatelessWidget {
  const InspiringStoriesWidget({super.key, required this.bloc});
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetSuccess) {
          final stories = state.homeList.stories;
          if (stories.isEmpty) {
            return const Center(child: Text("لا توجد قصص ملهمة بعد."));
          }
          return SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: stories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final story = stories[index];
                return Container(
                  width: context.getWidth() * 0.79,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppPalette.greyBackground,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          EditImageProfile(radius: 15),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              story.fullName,
                              style: TextStyles.sf60014,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Image.asset("assets/image/comment.png"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        story.title,
                        style: TextStyles.sf60014.copyWith(
                          color: AppPalette.black,
                        ),
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(
                          story.content,
                          style: TextStyles.sf40014.copyWith(
                            color: AppPalette.blackLight,
                          ),
                          textAlign: TextAlign.right,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        if (state is HomeLoading) {
          return const Center(child: LoadingWidget());
        }

        return const Center(child: Text("لم يتم تحميل البيانات."));
      },
    );
  }
}
