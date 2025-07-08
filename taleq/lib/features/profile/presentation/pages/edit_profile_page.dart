import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  // final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.editTitle),
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () => context.go('/profile'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            EditImageProfile(radius: 90),
            SizedBox(height: 7),
            CustomTextField(
              labelText: AppText.name,
              hintText: AppText.hintName,
              labelstyle: TextStyles.sf40020,
              controller: bloc.nameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              labelText: AppText.email,
              hintText: AppText.hintEmail,
              labelstyle: TextStyles.sf40020,
              controller: bloc.nameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              labelText: AppText.password,
              hintText: AppText.hintPassword,
              labelstyle: TextStyles.sf40020,
              controller: bloc.nameController,
            ),
            SizedBox(height: 42),
            CustomButton(
              onPressed: () {},
              child: Text(
                AppText.save,
                style: TextStyles.sf40016.copyWith(
                  color: AppPalette.whitePrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
