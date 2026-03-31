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

class ForContactScreen extends StatefulWidget {
  const ForContactScreen({super.key});

  @override
  State<ForContactScreen> createState() => _ForContactScreenState();
}

class _ForContactScreenState extends State<ForContactScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController jobNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    companyNameController.dispose();
    jobNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> codeInput = [
      firstNameController,
      lastNameController,
      companyNameController,
      jobNameController,
      phoneController,
      emailController,
      addressController,
      cityController,
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
                        'Contact',
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
                          Icons.perm_contact_cal_rounded,
                          size: 58.r,
                          color: CustomColor.goldColor,
                        ),
                        RowTextField(
                            controller1: firstNameController,
                            controller2: lastNameController,
                            labelText1: 'First Name',
                            labelText2: 'Last Name'),
                        RowTextField(
                          controller1: companyNameController,
                          controller2: jobNameController,
                          labelText1: 'Company',
                          labelText2: 'Job',
                          isRequired1: false,
                          isRequired2: false,
                        ),
                        CustomTextField(
                          labelText: 'phone',
                          controller: phoneController,
                        ),
                        CustomTextField(
                          labelText: 'Email',
                          controller: emailController,
                          isRequired: false,
                        ),
                        CustomTextField(
                          labelText: 'Address',
                          controller: addressController,
                          isRequired: false,
                        ),
                        RowTextField(
                          controller1: cityController,
                          controller2: countryController,
                          labelText1: 'City',
                          labelText2: 'Country',
                          isRequired1: false,
                          isRequired2: false,
                        ),
                        GenerateQrButton(
                          onTap: () async {
                            if (firstNameController.text.isNotEmpty &&
                                lastNameController.text.isNotEmpty &&
                                phoneController.text.isNotEmpty) {
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
