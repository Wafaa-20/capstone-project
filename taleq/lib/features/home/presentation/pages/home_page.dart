import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
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
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => GetIt.I<ProfileBloc>()),
      ],
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.liveStream,
                  style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                ),

                LiveStreamWidget(),
                Text(
                  AppText.welcomeMessage,
                  style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                ),
                SizedBox(height: 19),
                QuickSessionContainer(),
                SizedBox(height: 45),
                Text(
                  AppText.topSpecialists,
                  style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                ),
                Text(
                  AppText.inspiringStories,
                  style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
