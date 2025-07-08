import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';
import 'package:taleq/features/home/presentation/widget/live_stream_widget.dart';
import 'package:taleq/features/home/presentation/widget/quick_session_container.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<HomeBloc>()),
        BlocProvider(create: (context) => GetIt.I<ProfileBloc>()),
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
              actions: [
                CustomIconButton(
                  icon: Icons.notifications_active_outlined,
                  onPressed: () {
                    context.push('/reminder');
                  },
                ),
                CustomIconButton(icon: Icons.search),
              ],
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyles.sf40016.copyWith(color: Colors.red),
                    ),
                  );
                } else if (state is GetSuccess) {
                  if (state.specialistList.isEmpty) {
                    return const Center(child: Text("لا يوجد متخصصين حالياً"));
                  } else {
                    SingleChildScrollView(
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

                            LiveStreamWidget(
                              bloc: homeBloc,
                              imagesList: state.specialistList,
                            ),

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
                            Text(
                              AppText.inspiringStories,
                              style: TextStyles.sf40016.copyWith(
                                color: AppPalette.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return const Center(child: Text("حدث خطأ ما"));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
