import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_event.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_state.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key, required this.bloc});
  final ProfileBloc bloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(AppText.ar, style: TextStyles.sf50016),
              leading: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/image/ar.png'),
              ),
              onTap: () {
                bloc.add(ChangeLanguageEvent(localeCode: 'ar',context:context));
                context.customPop();
              },
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: AppPalette.bluePrimary,
            ),
            ListTile(
              title: Text(AppText.en, style: TextStyles.sf50016),
              leading: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/image/en.png'),
              ),
              onTap: () {
                bloc.add(ChangeLanguageEvent(localeCode: 'en',context:context));
                context.customPop();
              },
            ),
          ],
        );
      },
    );
  }
}
