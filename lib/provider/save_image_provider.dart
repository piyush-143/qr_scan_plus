import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_plus/widgets/uihelper/flushbar_message.dart';
import 'package:screenshot/screenshot.dart';

class SaveImageToGalleryProvider with ChangeNotifier {
  Future<void> saveImageToGallery(
      ScreenshotController controller, BuildContext context) async {
    final Uint8List? screenShot = await controller.capture();
    if (screenShot!.isNotEmpty) {
      final permission = await Permission.storage.request();
      if (permission.isGranted) {
        final result =
            await ImageGallerySaverPlus.saveImage(screenShot, quality: 50);
        if (result != null || result == "") {
          flushBarMessage(context, "Image saved to gallery");
        } else {
          flushBarMessage(context, "Unable to save image");
        }
      }
    }
  }
}
