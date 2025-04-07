import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

class ToggleProvider with ChangeNotifier {
  //Flash Toggle
  bool _isFlashOn = false;
  bool get isFlashOn => _isFlashOn;
  void toggleFlash(MobileScannerController mobileController) {
    _isFlashOn = !_isFlashOn;
    mobileController.toggleTorch();
    notifyListeners();
  }

//Camera Toggle
  bool _isFront = false;
  bool get isFront => _isFront;
  void toggleCamera(MobileScannerController mobileController) {
    _isFront = !_isFront;
    mobileController.switchCamera();
    notifyListeners();
  }

//Vibration Toggle
  bool _canVibrate = true;
  bool get canVibrate => _canVibrate;
  void toggleVibration(bool vibVal) {
    _canVibrate = vibVal;
    notifyListeners();
    if (vibVal == true) {
      vibrate();
    }
  }

//Check Device can Vibrate
  final bool _hasVibration = true;
  void setHasVibration(bool val) {
    _hasVibration == val;
    notifyListeners();
  }

//Perform Vibration
  void vibrate() async {
    if (canVibrate == true && _hasVibration == true) {
      await Vibration.vibrate(duration: 100);
    }
  }
}
