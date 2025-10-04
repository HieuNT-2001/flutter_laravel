import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<File?> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  static void showPickOptionsDialog({
    required BuildContext context,
    required Function(File) onImageSelected,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Chọn từ Thư viện'),
              onTap: () async {
                Navigator.of(context).pop();
                final file = await pickImage(ImageSource.gallery);
                if (file != null) onImageSelected(file);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Chụp ảnh'),
              onTap: () async {
                Navigator.of(context).pop();
                final file = await pickImage(ImageSource.camera);
                if (file != null) onImageSelected(file);
              },
            ),
          ],
        ),
      ),
    );
  }
}
