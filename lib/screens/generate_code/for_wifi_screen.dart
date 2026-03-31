import 'package:flutter/material.dart';
import 'package:qr_plus/data/models/qr_result.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/screens/result_screen.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/core/utils/concat_string.dart';
import 'package:qr_plus/core/utils/flushbar_message.dart';
import 'package:qr_plus/core/constants/size_data.dart';

import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/custom_text_field.dart';
import 'package:qr_plus/widgets/generate_qr_button.dart';
import 'package:qr_plus/core/constants/color.dart';

class ForWiFiScreen extends StatefulWidget {
  const ForWiFiScreen({super.key});

  @override
  State<ForWiFiScreen> createState() => _ForWiFiScreenState();
}

class _ForWiFiScreenState extends State<ForWiFiScreen> {
  final TextEditingController networkController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    networkController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> codeInput = [networkController, passController];
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
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
                        'Wi-Fi',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 22.r,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeData.belowAppBar.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      color: CustomColor.barBgColor.withAlpha(150),
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColor.goldColor, width: 2.h)),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.barBgColor,
                          blurRadius: 8.r,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0, 1.h),
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: 22.h,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.wifi,
                          size: 68.r,
                          color: CustomColor.goldColor,
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          labelText: 'Network',
                          controller: networkController,
                        ),
                        CustomTextField(
                          labelText: 'Password',
                          controller: passController,
                        ),
                        SizedBox(height: 10.h),
                        GenerateQrButton(
                          onTap: () async {
                            if (networkController.text.isNotEmpty &&
                                passController.text.isNotEmpty) {
                              final resultText = concatenateString(codeInput).text;
                              context.read<ToggleProvider>().vibrate();
                              context.read<DBProvider>().addCurrentData(
                                  code: resultText, isCreate: true);

                              final result = QRResult(
                                content: resultText,
                                date: DateTime.now(),
                                isCreated: true,
                              );

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      result: result,
                                    ),
                                  ));
                            } else {
                              flushBarMessage(
                                  context, 'Enter required details!!!');
                            }
                          },
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
