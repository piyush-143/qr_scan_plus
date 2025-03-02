import 'package:all_vibrate/all_vibrate.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
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

  bool _canVibrate = true;
  bool get canVibrate => _canVibrate;
  void toggleVibration(bool vibVal) {
    _canVibrate = vibVal;
    notifyListeners();
  }

  bool _canBeep = true;
  bool get canBeep => _canBeep;
  void toggleBeep(bool beepVal) async {
    _canBeep = beepVal;
    notifyListeners();
  }

  void vibBeep(AudioPlayer player) {
    if (canVibrate == true) {
      AllVibrate().simpleVibrate(period: 100, amplitude: 100);
    }
    if (canBeep == true) {
      player.play().timeout(Duration(seconds: 1));
      Future.delayed(Duration(seconds: 1));
    }
  }
}
