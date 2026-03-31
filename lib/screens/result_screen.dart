import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/qr_code_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/core/utils/flushbar_message.dart';
import 'package:qr_plus/core/constants/size_data.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:qr_plus/providers/save_image_provider.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/custom_share_save_button.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/constants/assets.dart';

import 'package:qr_plus/data/models/qr_result.dart';
import 'package:intl/intl.dart';

class ResultScreen extends StatefulWidget {
  final QRResult result;

  const ResultScreen({
    super.key,
    required this.result,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    bool isUrl = Uri.tryParse(widget.result.content)?.hasAbsolutePath ?? false;
    final toggleProvider = context.read<ToggleProvider>();
    final formattedDate = DateFormat('d MMM y, hh:mm a').format(widget.result.date);

    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeData.aboveAppBar.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  children: [
                    CustomCrossContainer(
                      icon: Icons.arrow_back_ios_sharp,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      size: 35.r,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Text(
                        'Result',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 30.r,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, bottom: 15.h, top: 10.h),
                decoration: BoxDecoration(
                  color: CustomColor.barBgColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.barBgColor,
                      blurRadius: 15.r,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 1.h),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      Row(
                        spacing: 20.w,
                        children: [
                          Image.asset(
                            AppAssets.resultIcon,
                            height: 40.r,
                            width: 40.r,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 22.r,
                                    ),
                              ),
                              Text(
                                formattedDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white60,
                                      fontSize: 13.r,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white30,
                        thickness: 1.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (isUrl) {
                            context.read<QrCodeProvider>().openUrl(widget.result.content);
                          }
                        },
                        onLongPress: () {
                          flushBarMessage(context, 'Copied to clipboard');
                          toggleProvider.vibrate();
                          Clipboard.setData(ClipboardData(text: widget.result.content));
                        },
                        child: Text(
                          widget.result.content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:
                                  isUrl ? Colors.blue.shade300 : Colors.white,
                              decoration: isUrl
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              decorationColor: Colors.blue.shade300,
                              fontSize: 17.r,
                              letterSpacing: 0,
                              height: 1.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Screenshot(
                controller: screenshotController,
                child: Center(
                  child: Container(
                    width: 200.w,
                    height: 200.w, // Maintain aspect ratio
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                          color: CustomColor.goldColor, width: 5.w),
                      boxShadow: [
                        BoxShadow(
                            color: CustomColor.barBgColor,
                            blurRadius: 10.r,
                            spreadRadius: 1.r)
                      ],
                    ),
                    child: QrImageView(
                      data: widget.result.content,
                      version: QrVersions.auto,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40.w,
                children: [
                  CustomShareSaveButton(
                      icon: Icons.share,
                      onTap: () {
                        SharePlus.instance.share(ShareParams(text: widget.result.content));
                        toggleProvider.vibrate();
                      },
                      text: 'Share'),
                  CustomShareSaveButton(
                      icon: Icons.file_copy,
                      onTap: () {
                        flushBarMessage(context, 'Copied to clipboard');
                        toggleProvider.vibrate();
                        Clipboard.setData(ClipboardData(text: widget.result.content));
                      },
                      text: 'Copy'),
                  CustomShareSaveButton(
                      icon: Icons.save_sharp,
                      onTap: () {
                        context
                            .read<SaveImageToGalleryProvider>()
                            .saveImageToGallery(screenshotController, context);
                        toggleProvider.vibrate();
                      },
                      text: 'Save'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
