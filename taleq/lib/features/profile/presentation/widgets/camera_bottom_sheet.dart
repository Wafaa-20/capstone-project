import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';
import 'package:taleq/features/profile/domain/usecases/pick_image_use_case.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_event.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_option.dart';

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({super.key, required this.bloc});
  final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppText.editProfilePicture, style: TextStyles.sf70025),
          SizedBox(height: 30),
          EditOption(
            text: AppText.takePhoto,
            icon: Icons.camera_alt_outlined,
            onTap: () {
              bloc.add(
                PickAvatarEvent(
                  PickImageParams(source: ImageSourceType.camera),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          EditOption(
            text: AppText.choosePhoto,
            icon: Icons.photo_library,
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
            text: AppText.deletePhoto,
            icon: Icons.delete,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
