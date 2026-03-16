import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/formatters.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/core/utils/flushbar_message.dart';
import 'package:qr_plus/core/constants/size_data.dart';

import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/utils/concat_string.dart';
import '../result_screen.dart';

class ForEventScreen extends StatefulWidget {
  const ForEventScreen({super.key});

  @override
  State<ForEventScreen> createState() => _ForEventScreenState();
}

class _ForEventScreenState extends State<ForEventScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController startDateTimeController = TextEditingController();
  TextEditingController endDateTimeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    startDateTimeController.dispose();
    endDateTimeController.dispose();
    locationController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> code = [
      nameController,
      startDateTimeController,
      endDateTimeController,
      locationController,
      descController
    ];
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: EdgeInsets.only(left: 25.0.w, right: 25.w, bottom: 5.h),
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
                        "Event",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontSize: 22.r,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
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
                      spacing: 15.h,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.event_available,
                          size: 65.r,
                          color: CustomColor.goldColor,
                        ),
                        CustomTextField(
                          labelText: "Event Name",
                          controller: nameController,
                        ),
                        RowTextField(
                            controller1: startDateTimeController,
                            controller2: endDateTimeController,
                            labelText1: "Start Date",
                            labelText2: "End Date"),
                        CustomTextField(
                          labelText: "Event Location",
                          controller: locationController,
                        ),
                        CustomTextField(
                          labelText: "Description",
                          controller: descController,
                          minLines: 2,
                          isRequired: false,
                        ),
                        SizedBox(height: 0.h),
                        GenerateQrButton(
                          onTap: () async {
                            if (nameController.text.isNotEmpty &&
                                startDateTimeController.text.isNotEmpty &&
                                endDateTimeController.text.isNotEmpty &&
                                locationController.text.isNotEmpty) {
                              
                              final resultText = concatenateString(code).text;
                              context.read<ToggleProvider>().vibrate();
                              context.read<DBProvider>().addCurrentData(
                                  code: resultText,
                                  isCreate: true);
 
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      code: resultText,
                                      date: CustomFormat.now(),
                                    ),
                                  ));
                            } else {
                              flushBarMessage(
                                  context, "Enter required details !");
                            }
                          },
                        ),
                        SizedBox(height: 0.h),
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
