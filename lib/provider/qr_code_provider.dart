import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_plus/widgets/uihelper/flushbar_message.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeProvider with ChangeNotifier {
  String _detectedQrCode = '';
  String get detectedQrCode => _detectedQrCode;

  String _scannedQrCode = '';
  String get scannedQrCode => _scannedQrCode;
  void setQrCode(List<Barcode> barcodes) {
    _scannedQrCode = barcodes.first.rawValue ?? "---";
    notifyListeners();
  }

  Future<void> pickImageAndScan(
      BuildContext context, MobileScannerController controller) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final barcode = await controller.analyzeImage(image.path);
      if (barcode != null && barcode.barcodes.isNotEmpty) {
        _detectedQrCode = barcode.barcodes.first.rawValue.toString();
        notifyListeners();
      } else {
        flushBarMessage(context, "No code found!!!");
        _detectedQrCode = "";
      }
    } else {
      flushBarMessage(context, "Image not picked!!!");
      _detectedQrCode = "";
    }
  }

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}
