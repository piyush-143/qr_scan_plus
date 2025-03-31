import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/qr_code_provider.dart';
import 'package:qr_plus/provider/toggle_provider.dart';
import 'package:qr_plus/screen/setting_screen.dart';

import '../provider/db_provider.dart';
import '../screen/result_screen.dart';
import 'uihelper/color.dart';

class CustomTopBar extends StatelessWidget {
  final MobileScannerController mobileController;

  const CustomTopBar({required this.mobileController, super.key});

  @override
  Widget build(BuildContext context) {
    final readToggle = context.read<ToggleProvider>();
    final watchToggle = context.watch<ToggleProvider>();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: CustomColor.barBgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: CustomColor.barBgColor, blurRadius: 8)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<QrCodeProvider>(
            builder: (context, value, child) => _topBarButton(
              icon: Icons.image_rounded,
              color: Colors.white,
              onTap: () {
                final date = DateTime.now();
                String d =
                    "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";

                context
                    .read<QrCodeProvider>()
                    .pickImageAndScan(context, mobileController)
                    .whenComplete(
                  () {
                    if (value.detectedQrCode != "") {
                      readToggle.vibrate();
                      context.read<DBProvider>().addData(
                            code: value.detectedQrCode,
                            date: DateTime.now(),
                            isCreate: false,
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            code: value.detectedQrCode,
                            date: d,
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
              context.read<ToggleProvider>().toggleFlash(mobileController);
            },
            color: watchToggle.isFlashOn ? CustomColor.goldColor : Colors.white,
          ),
          _topBarButton(
            icon: watchToggle.isFront
                ? Icons.camera_front
                : Icons.photo_camera_back,
            onTap: () {
              context.read<ToggleProvider>().toggleCamera(mobileController);
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
                    builder: (context) => SettingScreen(),
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
        size: 30,
      ),
    );
  }
}
