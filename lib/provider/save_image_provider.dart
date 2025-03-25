import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_pluscker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../widgets/uihelper/flushbar_message.dart';

class SaveImageToGalleryProvider with ChangeNotifier {
  Future<void> saveImageToGallery(
      ScreenshotController controller, BuildContext context) async {
    final Uint8List? screenShot = await controller.capture();
    notifyListeners();
    if (screenShot!.isNotEmpty) {
      final permission = await Permission.storage.request();
      if (permission.isGranted) {
        final result = await ImageGallerySaverPlus.saveImage(screenShot);
        if (result != null || result == "") {
          flushBarMessage(context, "Image saved to gallery");
        } else {
          flushBarMessage(context, "Unable to save image");
        }
      }
    }
  }
}
