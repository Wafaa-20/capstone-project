import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key, required this.bloc});
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قصتك").tr(),
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios,
          size: 20,
          color: AppPalette.black,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.title.tr(),
                style: TextStyles.sf70018.copyWith(color: AppPalette.black),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: bloc.titleController,
                      keyboardType: TextInputType.multiline,
                      hintText: AppText.hintTitle.tr(),
                    ),
                    CustomTextField(
                      controller: bloc.storyController,
                      keyboardType: TextInputType.multiline,
                      hintText: AppText.hintStory.tr(),
                      minLines: 5,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
              Spacer(),

              CustomButton(
                width: context.getWidth(),
                onPressed: () {},
                child: Text(
                  AppText.shareStory2,
                  style: TextStyles.sf70020.copyWith(
                    // color: AppPalette.whitePrimary,
                  ),
                ),
              ),
              // SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
