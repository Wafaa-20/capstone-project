import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/home/presentation/bloc/home_event.dart';
import 'package:taleq/features/home/presentation/bloc/home_state.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قصتك"),
        leading: CustomIconButton(
          icon: Icons.arrow_back_ios,
          size: 20,
          color: AppPalette.black,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<HomeBloc>(),
        child: Builder(
          builder: (context) {
            final bloc = context.read<HomeBloc>();
            return BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is GetFailure) {
                  ScaffoldMessenger.maybeOf(
                    context,
                  )!.showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.title,
                        style: TextStyles.sf70018.copyWith(
                          color: AppPalette.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is SendSuccess) {
                              bloc.titleController.clear();
                              bloc.storyController.clear();
                              context.go('/navigation');
                            }
                            return Column(
                              children: [
                                CustomTextField(
                                  controller: bloc.titleController,
                                  keyboardType: TextInputType.multiline,
                                  hintText: AppText.hintTitle,
                                ),

                                CustomTextField(
                                  controller: bloc.storyController,
                                  keyboardType: TextInputType.multiline,
                                  hintText: AppText.hintStory,
                                  minLines: 5,
                                  maxLines: 10,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Spacer(),

                      CustomButton(
                        width: context.getWidth(),
                        onPressed: () {
                          bloc.add(
                            InsertStory(
                              title: bloc.titleController.text,
                              text: bloc.storyController.text,
                            ),
                          );
                        },
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
          },
        ),
      ),
    );
  }
}
