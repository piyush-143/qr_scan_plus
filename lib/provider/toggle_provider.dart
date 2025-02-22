import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ToggleProvider with ChangeNotifier {
  bool _isFlashOn = false;
  bool get isFlashOn => _isFlashOn;
  void toggleFlash(MobileScannerController mobileController) {
    _isFlashOn = !_isFlashOn;
    mobileController.toggleTorch();
    notifyListeners();
  }

  bool _isFront = false;
  bool get isFront => _isFront;
  void toggleCamera(MobileScannerController mobileController) {
    _isFront = !_isFront;
    mobileController.switchCamera();
    notifyListeners();
  }
}
