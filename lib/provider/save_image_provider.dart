import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class SaveImageToGalleryProvider with ChangeNotifier {
  Future<void> saveImageToGallery(
      ScreenshotController controller, BuildContext context) async {
    final Uint8List? screenShot = await controller.capture();
    notifyListeners();
    // if (screenShot!.isNotEmpty) {
    //   final permission = await Permission.storage.request();
    //   if (permission.isGranted) {
    //     final result = await ImageGallerySaverPlus.saveImage(screenShot);
    //     if (result != null || result == "") {
    //       flushBarMessage(context, "Image saved to gallery");
    //     } else {
    //       flushBarMessage(context, "Unable to save image");
    //     }
    //   }
    // }
  }
}
