import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_event.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_state.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';
import 'package:taleq/features/profile/presentation/widgets/join_As_Specialist_widget.dart';
import 'package:taleq/features/profile/presentation/widgets/profile_options_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ProfileBloc>()..add(LoadProfileEvent()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            context.go('/login');
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppText.profileTitle),
              centerTitle: true,
              leading: CustomIconButton(
                icon: Icons.arrow_back_ios,
                onPressed: () => context.push('/reminder'),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 24),
                EditImageProfile(radius: 80, isWithCamera: true),
                SizedBox(height: 27),
                Text("fullName", style: TextStyles.sf40020),
                SizedBox(height: 10),
                Text(
                  "email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppPalette.blueLight,
                  ),
                ),
                SizedBox(height: 27),
                Flexible(child: ProfileOptionsBody()),
                JoinAsSpecialistWidget(),
                SizedBox(height: 75),
              ],
            ),
          );
        },
      ),
    );
  }
}
