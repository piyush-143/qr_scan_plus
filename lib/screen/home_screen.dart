import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_plus/screen/result_screen.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';
import 'package:qr_plus/widgets/custom_bottom_bar.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import '../widgets/custom_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mobileController = MobileScannerController();
    bool isScanDone = false;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: MobileScanner(
              controller: mobileController,
              onDetect: (detectedCode) {
                final List<Barcode> barcodes = detectedCode.barcodes;
                if (!isScanDone) {
                  String code = barcodes.first.rawValue ?? "--";
                  isScanDone = true;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(code: code),
                      ));
                }
              },
            ),
          ),
          QRScannerOverlay(
            scanAreaSize: Size(260, 260),
            borderRadius: 15,
            borderColor: CustomColor.goldColor,
            borderStrokeWidth: 5,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35, top: 25),
              child: CustomTopBar(
                mobileController: mobileController,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35, bottom: 30),
              child: CustomBottomBar(),
            ),
          ),
        ],
      ),
    );
  }
}
