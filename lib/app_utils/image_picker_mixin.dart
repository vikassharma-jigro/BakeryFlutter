import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerMixin<T extends StatefulWidget> on State<T> {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromCamera({int imageQuality = 20}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: imageQuality,
      );
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      debugPrint("Error picking image from camera: $e");
    }
    return null;
  }

  Future<File?> pickImageFromGallery({int imageQuality = 20}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
      );
      if (image != null) {
        return File(image.path);
      }
    } catch (e) {
      debugPrint("Error picking image from gallery: $e");
    }
    return null;
  }

  void showImagePickerOptions({required Function(File file) onImagePicked}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Gallery'),
                onTap: () async {
                  final file = await pickImageFromGallery();
                  if (file != null) onImagePicked(file);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () async {
                  final file = await pickImageFromCamera();
                  if (file != null) onImagePicked(file);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
