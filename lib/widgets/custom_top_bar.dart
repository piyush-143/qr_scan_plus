import 'package:flutter/material.dart';
import 'package:qr_plus/data/models/qr_result.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/qr_code_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/screens/setting_screen.dart';

import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/screens/result_screen.dart';
import 'package:qr_plus/core/constants/color.dart';

class CustomTopBar extends StatelessWidget {
  final MobileScannerController mobileController;

  const CustomTopBar({required this.mobileController, super.key});

  @override
  Widget build(BuildContext context) {
    final readToggle = context.read<ToggleProvider>();
    final watchToggle = context.watch<ToggleProvider>();
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: CustomColor.barBgColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [BoxShadow(color: CustomColor.barBgColor, blurRadius: 8.r)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<QrCodeProvider>(
            builder: (context, value, child) => _topBarButton(
              icon: Icons.image_rounded,
              color: Colors.white,
              onTap: () {
                context
                    .read<QrCodeProvider>()
                    .pickImageAndScan(context, mobileController)
                    .whenComplete(
                  () {
                    if (!context.mounted) return;
                    if (value.detectedQrCode != '') {
                      readToggle.vibrate();
                      context.read<DBProvider>().addCurrentData(
                          code: value.detectedQrCode, isCreate: false);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            result: QRResult(
                              content: value.detectedQrCode,
                              date: DateTime.now(),
                              isCreated: false,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          _topBarButton(
            icon: watchToggle.isFlashOn ? Icons.flash_on : Icons.flash_off,
            onTap: () {
              readToggle.toggleFlash(mobileController);
            },
            color: watchToggle.isFlashOn ? CustomColor.goldColor : Colors.white,
          ),
          _topBarButton(
            icon: watchToggle.isFront
                ? Icons.camera_front
                : Icons.photo_camera_back,
            onTap: () {
              readToggle.toggleCamera(mobileController);
            },
            color: watchToggle.isFront ? CustomColor.goldColor : Colors.white,
          ),
          _topBarButton(
            icon: Icons.settings,
            color: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }

  Widget _topBarButton(
      {required IconData icon,
      required VoidCallback onTap,
      required Color color}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: color,
        size: 30.r,
      ),
    );
  }
}
