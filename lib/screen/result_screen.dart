import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/flushbar_message.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';
import 'package:screenshot/screenshot.dart';

import '../widgets/custom_cross_container.dart';
import '../widgets/custom_share_save_button.dart';
import '../widgets/uihelper/color.dart';

class ResultScreen extends StatefulWidget {
  final String code;
  final Widget navBack;
  final String date;

  const ResultScreen({
    super.key,
    required this.code,
    required this.navBack,
    required this.date,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeData.aboveAppBar),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    CustomCrossContainer(
                      icon: Icons.arrow_back_ios_sharp,
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget.navBack,
                            ));
                      },
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        "Result",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
                decoration: BoxDecoration(
                  color: CustomColor.barBgColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.barBgColor,
                      blurRadius: 15,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          Image.asset(
                            "assets/result/resultIcon.png",
                            height: 40,
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                              ),
                              Text(
                                widget.date,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white60,
                                      fontSize: 13,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white30,
                        thickness: 1,
                      ),
                      Text(
                        widget.code,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: 0,
                            height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: CustomColor.goldColor, width: 5),
                    boxShadow: [
                      BoxShadow(
                          color: CustomColor.barBgColor,
                          blurRadius: 10,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Screenshot(
                    controller: screenshotController,
                    child: QrImageView(
                      data: widget.code,
                      version: QrVersions.auto,
                    ),
                  ),
                  //child: Image.file(image!),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: [
                  CustomShareSaveButton(
                      icon: Icons.share, onTap: () {}, text: "Share"),
                  CustomShareSaveButton(
                      icon: Icons.file_copy,
                      onTap: () {
                        flushBarMessage(context, "Copied to clipboard");
                        Clipboard.setData(ClipboardData(text: widget.code));
                      },
                      text: "Copy"),
                  CustomShareSaveButton(
                      icon: Icons.save_sharp,
                      onTap: () {
                        // context
                        //     .read<ImagesProvider>()
                        //     .saveImageToGallery(screenshotController, context);
                      },
                      text: "Save"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
