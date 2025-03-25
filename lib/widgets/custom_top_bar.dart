import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/qr_code_provider.dart';
import 'package:qr_plus/provider/toggle_provider.dart';
import 'package:qr_plus/screen/setting_screen.dart';

import '../provider/db_provider.dart';
import '../screen/home_screen.dart';
import '../screen/result_screen.dart';
import 'uihelper/color.dart';

class CustomTopBar extends StatefulWidget {
  final MobileScannerController mobileController;

  const CustomTopBar({required this.mobileController, super.key});

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
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
            builder: (context, value, child) => _buildButton(
              icon: Icons.image_rounded,
              color: Colors.white,
              onTap: () {
                final date = DateTime.now();
                String d =
                    "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";

                context
                    .read<QrCodeProvider>()
                    .pickImageAndScan(context, widget.mobileController)
                    .whenComplete(
                  () {
                    if (value.detectedQrCode != "") {
                      context.read<DBProvider>().addData(
                            code: value.detectedQrCode,
                            date: DateTime.now(),
                            isCreate: false,
                          );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            code: value.detectedQrCode,
                            navBack: HomeScreen(),
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
          _buildButton(
            icon: toggleProvider.isFlashOn ? Icons.flash_on : Icons.flash_off,
            onTap: () {
              context
                  .read<ToggleProvider>()
                  .toggleFlash(widget.mobileController);
            },
            color:
                toggleProvider.isFlashOn ? CustomColor.goldColor : Colors.white,
          ),
          _buildButton(
            icon: toggleProvider.isFront
                ? Icons.camera_front
                : Icons.photo_camera_back,
            onTap: () {
              context
                  .read<ToggleProvider>()
                  .toggleCamera(widget.mobileController);
            },
            color:
                toggleProvider.isFront ? CustomColor.goldColor : Colors.white,
          ),
          _buildButton(
            icon: Icons.settings,
            color: Colors.white,
            onTap: () {
              Navigator.pushReplacement(
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

  Widget _buildButton(
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
