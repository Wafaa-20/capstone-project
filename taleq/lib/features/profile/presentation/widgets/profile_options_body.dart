import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/constants/list_constants.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/custom_icon.dart';
import 'package:taleq/core/widget/custom_show_dialog.dart';
import 'package:taleq/features/profile/presentation/widgets/language_body.dart';

class ProfileOptionsBody extends StatelessWidget {
  const ProfileOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ListConstants.profileData.length,
      itemBuilder: (BuildContext context, int index) {
        final list = ListConstants.profileData[index];
        return InkWell(
          onTap: () {
            if (list.title == AppText.language) {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: AppPalette.whitePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LanguageBody(),
                ),
              );
            } else if (list.title == AppText.logout) {
              CustomShowDialog.show(
                context: context,
                blocContext: context,
                title: Text(AppText.logout),
                content: const Text('هل أنت متأكد؟'),
                text: AppText.addGroup,
                onPressed: () {
                  // context.read<ProfileBloc>().add(const SignOutEvent());
                  Navigator.of(context).pop(); // أو context.customPop()
                },
              );
            } else {
              context.go(list.route!);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 17,
              top: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                CustomIcon(icon: list.icon, isWithContainer: true),
                SizedBox(width: 9),
                Text(
                  list.title,
                  style: TextStyles.sf40016.copyWith(color: AppPalette.black),
                ),
                Spacer(),
                CustomIcon(icon: list.iconBack, size: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
