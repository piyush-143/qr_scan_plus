import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/db_provider.dart';
import 'package:qr_plus/provider/toggle_provider.dart';
import 'package:qr_plus/screen/result_screen.dart';
import 'package:qr_plus/widgets/custom_bottom_bar.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../widgets/custom_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mobileController = MobileScannerController();
  bool isScanDone = false;
  final player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DBProvider>().getInitialData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mobileController.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toggleProvider = context.read<ToggleProvider>();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: MobileScanner(
              controller: mobileController,
              onDetect: (detectedCode) async {
                final List<Barcode> barcodes = detectedCode.barcodes;

                if (!isScanDone) {
                  final date = DateTime.now();
                  String d =
                      "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
                  String code = barcodes.first.rawValue ?? "--";
                  await player.setAsset("assets/audio/beepSound.mp3");
                  isScanDone = true;
                  toggleProvider.vibBeep(player);
                  context.read<DBProvider>().addData(
                      code: code, date: DateTime.now(), isCreate: false);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          code: code,
                          navBack: HomeScreen(),
                          date: d,
                        ),
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
