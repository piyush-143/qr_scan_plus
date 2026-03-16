import 'package:flutter/services.dart';
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
      vibrate(force: true);
    }
  }

//Check Device can Vibrate
  bool _hasVibration = true;
  void setHasVibration(bool val) {
    _hasVibration = val;
    notifyListeners();
  }

//Perform Vibration
  void vibrate({bool force = false}) async {
    if (force || (canVibrate == true && _hasVibration == true)) {
      // Use HapticFeedback as a reliable fallback/companion
      HapticFeedback.vibrate();
      
      // Also try the vibration plugin for a more distinct pulse if available
      final hasVibrator = await Vibration.hasVibrator();
      if (hasVibrator == true) {
        Vibration.vibrate(duration: 100);
      }
    }
  }
}
