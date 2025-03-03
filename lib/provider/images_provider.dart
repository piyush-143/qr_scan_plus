import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
// import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/uihelper/flushbar_message.dart';

class ImagesProvider with ChangeNotifier {
  File? _image;
  File? get image => _image;

  Future getGalleryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }

  Future<void> saveImageToGallery(
      ScreenshotController controller, BuildContext context) async {
    final Uint8List? screenShot = await controller.capture();
    notifyListeners();
    if (screenShot!.isNotEmpty) {
      final permission = await Permission.storage.request();
      if (permission.isGranted) {
        // final result = await ImageGallerySaverPlus.saveImage(screenShot);
        // if (result != null || result == "") {
        //   flushBarMessage(context, "Image saved to gallery");
        // } else {
        //   flushBarMessage(context, "Unable to save image");
        // }
      }
    }
  }
}
