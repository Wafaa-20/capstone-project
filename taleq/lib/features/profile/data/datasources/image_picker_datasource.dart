import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImagePickerDatasource {
  Future<File?> pickImageFromCamera();
  Future<File?> pickImageFromGallery();
}

class ImagePickerDatasourceImpl implements ImagePickerDatasource {
  final picker = ImagePicker();

  //Capture a photo.
  @override
  Future<File?> pickImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    return photo == null ? null : File(photo.path);
  }

  // Pick an image.

  @override
  Future<File?> pickImageFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image == null ? null : File(image.path);
  }
}
