import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/core/widget/custom_bottom_sheet.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_state.dart';
import 'package:taleq/features/profile/presentation/widgets/camera_bottom_sheet.dart';

class EditImageProfile extends StatelessWidget {
  const EditImageProfile({
    super.key,
    this.radius,
    this.isWithCamera = false,
    NetworkImage? imageProvider,
    this.onTap,
  });
  final double? radius;
  final bool isWithCamera;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final bloc = context.read<ProfileBloc>();
        final imageState = state is SelectedImageProfile;
        final hasPicked = imageState ? FileImage(state.image) : null;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: GestureDetector(
                onTap: imageState
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: InteractiveViewer(
                              child: Image(
                                image: hasPicked!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      }
                    : null,
                child: InkWell(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: radius ?? 75,
                    backgroundColor: AppPalette.greySurface,
                    backgroundImage: hasPicked,
                    child: imageState
                        ? null
                        : Image.asset("assets/image/profile.png"),
                  ),
                ),
              ),
            ),
            isWithCamera
                ? Positioned(
                    bottom: -10,
                    right: 140,
                    child: CustomIconButton(
                      icon: Icons.photo_camera_outlined,
                      size: 22,
                      height: 35,
                      width: 35,
                      containerColor: AppPalette.bluePrimary,
                      color: AppPalette.whitePrimary,
                      withContainer: true,
                      onPressed: () {
                        customBottomSheet(
                          context,
                          height: 320,
                          color: AppPalette.whiteLight,
                          CameraBottomSheet(bloc: bloc),
                        );
                      },
                    ),
                  )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
