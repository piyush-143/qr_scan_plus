import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

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

  bool _canVibrate = true;
  bool get canVibrate => _canVibrate;
  void toggleVibration(bool vibVal) {
    _canVibrate = vibVal;
    notifyListeners();
    if (vibVal == true) {
      vib();
    }
  }

  final bool _hasVibration = true;
  void setHasVibration(bool val) {
    _hasVibration == val;
    notifyListeners();
  }

  void vib() async {
    if (canVibrate == true && _hasVibration == true) {
      await Vibration.vibrate(duration: 100);
    }
  }
}
