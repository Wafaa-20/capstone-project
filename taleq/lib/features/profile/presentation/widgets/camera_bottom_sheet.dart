import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';
import 'package:taleq/features/profile/domain/usecases/pick_image_use_case.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_event.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_option.dart';

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({
    super.key,
    required this.bloc,
    this.isDelate = false,
  });
  final ProfileBloc bloc;
  final bool isDelate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppText.editProfilePicture.tr(),

              style: TextStyles.sf70020.copyWith(color: AppPalette.black),
            ),
          ),
          SizedBox(height: 30),
          EditOption(
            text: AppText.takePhoto.tr(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            icon: Icons.camera_alt_outlined,
            onTap: () {
              bloc.add(
                PickAvatarEvent(
                  PickImageParams(source: ImageSourceType.camera),
                ),
              );
            },
          ),
          Divider(thickness: 2, height: 2, color: AppPalette.whitePrimary),

          EditOption(
            text: AppText.choosePhoto.tr(),
            icon: Icons.photo_library,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            onTap: () {
              bloc.add(
                PickAvatarEvent(
                  PickImageParams(source: ImageSourceType.gallery),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          EditOption(
            text: AppText.deletePhoto.tr(),
            icon: Icons.delete,
            style: TextStyles.sf50018.copyWith(color: AppPalette.deleteRed),
            color: AppPalette.deleteRed,
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
