import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
<<<<<<< HEAD
import 'package:taleq/core/widget/inspiring_stories_widget.dart';
=======
import 'package:taleq/core/widget/loading_widget.dart';
>>>>>>> be227b0a6b29566b0f4b972f7281c9bde30bbf96
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/home/presentation/bloc/home_event.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';
import 'package:taleq/features/home/presentation/pages/story_page.dart';
import 'package:taleq/features/home/presentation/widget/live_stream_widget.dart';
import 'package:taleq/features/home/presentation/widget/quick_session_container.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_bloc.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/widgets/specialist_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<HomeBloc>()..add(GetSpecialistData()),
        ),
        BlocProvider(create: (context) => GetIt.I<ProfileBloc>()),
        BlocProvider(
          create: (context) =>
              GetIt.I<SpecialistsBloc>()..add(LoadSpecialists()),
        ),
      ],
      child: Builder(
        builder: (context) {
          final homeBloc = context.read<HomeBloc>();

          return Scaffold(
            appBar: AppBar(
              leading: EditImageProfile(
                radius: 20,
                onTap: () => context.go('/profile'),
              ),
              title: Text("أهلاً عبير"),
              actions: [
                CustomIconButton(
                  icon: Icons.notifications_active_outlined,
                  size: 30,
                  color: AppPalette.black,
                  onPressed: () {
                    context.push('/reminder');
                  },
                ),
                CustomIconButton(
                  icon: Icons.search,
                  size: 33,
                  color: AppPalette.black,
                  onPressed: () {},
                ),
              ],
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: LoadingWidget());
                } else if (state is GetFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyles.sf40016.copyWith(color: Colors.red),
                    ),
                  );
                } else if (state is GetSuccess) {
                  
                  if (state.homeList.specialists.isEmpty) {
                    return const Center(child: Text("لا يوجد متخصصين حالياً"));
                  } else {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: context.getHeight(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.liveStream,
                              style: TextStyles.sf40016.copyWith(
                                color: AppPalette.black,
                              ),
                            ),

                            LiveStreamWidget(bloc: homeBloc),

                            Text(
                              AppText.welcomeMessage,
                              style: TextStyles.sf40016.copyWith(
                                color: AppPalette.black,
                              ),
                            ),
                            SizedBox(height: 19),
                            QuickSessionContainer(),
                            SizedBox(height: 45),
                            Text(
                              AppText.topSpecialists,
                              style: TextStyles.sf40016.copyWith(
                                color: AppPalette.black,
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 114,
                                maxWidth: 361,
                              ),
                              child: SpecialistCard(
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppText.inspiringStories,
                              style: TextStyles.sf40016.copyWith(
                                color: AppPalette.black,
                              ),
                            ),
                            SizedBox(height: 25),
                            InspiringStoriesWidget(
                              avatar: '',
                              name: '',
                              title: '',
                              story: '',
                            ),
                            SizedBox(height: 21),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                height: 33,
                                width: 124,
                                onPressed: () {
                                  context.customPush(StoryPage(bloc: homeBloc));
                                },
                                child: Text(
                                  AppText.shareStory,
                                  style: TextStyles.sf40016.copyWith(
                                    color: AppPalette.whitePrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return SingleChildScrollView(
                  child: SizedBox(
                    height: context.getHeight(),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.liveStream,
                            style: TextStyles.sf40016.copyWith(
                              color: AppPalette.black,
                            ),
                          ),

                          LiveStreamWidget(bloc: homeBloc),

                          Text(
                            AppText.welcomeMessage,
                            style: TextStyles.sf40016.copyWith(
                              color: AppPalette.black,
                            ),
                          ),
                          SizedBox(height: 19),
                          QuickSessionContainer(),
                          SizedBox(height: 45),
                          Text(
                            AppText.topSpecialists,
                            style: TextStyles.sf40016.copyWith(
                              color: AppPalette.black,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 114,
                              maxWidth: 361,
                            ),
                            child: SpecialistCard(
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            AppText.inspiringStories,
                            style: TextStyles.sf40016.copyWith(
                              color: AppPalette.black,
                            ),
                          ),
                          SizedBox(height: 25),
<<<<<<< HEAD
                          InspiringStoriesWidget(
                            avatar: '',
                            name: '',
                            title: '',
                            story: '',
                          ),
=======
                          InspiringStoriesWidget(bloc: homeBloc,),
>>>>>>> be227b0a6b29566b0f4b972f7281c9bde30bbf96
                          SizedBox(height: 21),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              height: 33,
                              width: 124,
                              onPressed: () {
                                context.customPush(StoryPage());
                              },
                              child: Text(
                                AppText.shareStory,
                                style: TextStyles.sf40016.copyWith(
                                  color: AppPalette.whitePrimary,
                                ),
                              ),
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
        },
      ),
    );
  }
}
