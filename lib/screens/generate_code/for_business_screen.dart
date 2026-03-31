import 'package:flutter/material.dart';
import 'package:qr_plus/data/models/qr_result.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/core/utils/flushbar_message.dart';

import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/custom_text_field.dart';
import 'package:qr_plus/widgets/generate_qr_button.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/utils/concat_string.dart';
import 'package:qr_plus/screens/result_screen.dart';

class ForBusinessScreen extends StatefulWidget {
  const ForBusinessScreen({super.key});

  @override
  State<ForBusinessScreen> createState() => _ForBusinessScreenState();
}

class _ForBusinessScreenState extends State<ForBusinessScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    industryController.dispose();
    phoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
    addressController.dispose();
    stateController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> codeInput = [
      nameController,
      industryController,
      phoneController,
      emailController,
      websiteController,
      addressController,
      stateController,
      countryController
    ];
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: EdgeInsets.only(left: 25.0.w, right: 25.w, bottom: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
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
                        'Business',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 22.r,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
                      spacing: 9.h,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.business_sharp,
                          size: 58.r,
                          color: CustomColor.goldColor,
                        ),
                        CustomTextField(
                          labelText: 'Company Name',
                          controller: nameController,
                        ),
                        CustomTextField(
                          labelText: 'Industry Name',
                          controller: industryController,
                        ),
                        CustomTextField(
                          labelText: 'Phone',
                          controller: phoneController,
                        ),
                        CustomTextField(
                          labelText: 'Email',
                          controller: emailController,
                        ),
                        CustomTextField(
                          labelText: 'Website',
                          controller: websiteController,
                        ),
                        CustomTextField(
                          labelText: 'Address',
                          controller: addressController,
                        ),
                        RowTextField(
                          controller1: stateController,
                          controller2: countryController,
                          labelText1: 'State Name',
                          labelText2: 'Country Name',
                          isRequired1: false,
                          isRequired2: false,
                        ),
                        GenerateQrButton(
                          onTap: () async {
                            if (nameController.text.isNotEmpty &&
                                industryController.text.isNotEmpty &&
                                phoneController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                websiteController.text.isNotEmpty &&
                                addressController.text.isNotEmpty) {
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
                                  context, 'Enter required details !');
                            }
                          },
                        ),
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
