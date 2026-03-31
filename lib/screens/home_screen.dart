import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/data/models/qr_result.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/screens/result_screen.dart';
import 'package:qr_plus/widgets/custom_bottom_bar.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import 'package:qr_plus/widgets/custom_top_bar.dart';
import 'package:qr_plus/core/constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MobileScannerController mobileController =
      MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<DBProvider>().getInitialData();
      }
    });
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toggleProvider = context.read<ToggleProvider>();
    return Scaffold(
      body: Stack(
        children: [
          RepaintBoundary(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: MobileScanner(
                    controller: mobileController,
                    onDetect: (detectedCode) async {
                      String scannedCode =
                          detectedCode.barcodes.first.rawValue.toString();

                      toggleProvider.vibrate();
                      context.read<DBProvider>().addCurrentData(
                            code: scannedCode,
                            isCreate: false,
                          );

                      if (mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              result: QRResult(
                                content: scannedCode,
                                date: DateTime.now(),
                                isCreated: false,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                QRScannerOverlay(
                  scanAreaSize: Size(260.w, 250.h),
                  borderRadius: 15.r,
                  borderColor: CustomColor.goldColor,
                  borderStrokeWidth: 7.w,
                ),
                Center(
                  child: Image.asset(
                    'assets/home/overlayMidLine.png',
                    width: 260.w,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 55.h),
              child: CustomTopBar(
                mobileController: mobileController,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 24.r,
                  ),
                  ValueListenableBuilder(
                    valueListenable: mobileController,
                    builder: (context, state, child) => Slider(
                      value: state.zoomScale,
                      onChanged: mobileController.setZoomScale,
                      activeColor: CustomColor.goldColor,
                      thumbColor: CustomColor.goldColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24.r,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 35.w, right: 35.w, bottom: 40.h, top: 25.h),
                child: const CustomBottomBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
