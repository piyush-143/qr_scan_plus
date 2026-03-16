import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/screens/result_screen.dart';
import 'package:qr_plus/core/utils/flushbar_message.dart';
import 'package:qr_plus/core/constants/size_data.dart';

import 'package:qr_plus/providers/db_provider.dart';
import 'custom_cross_container.dart';
import 'custom_text_field.dart';
import 'generate_qr_button.dart';
import 'oval_bg.dart';
import 'package:qr_plus/core/constants/color.dart';

class SingleField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String labelText;
  final IconData icon;
  final int? minLines;

  const SingleField({
    required this.controller,
    required this.title,
    required this.labelText,
    required this.icon,
    this.minLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OvalBg(
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
                    onTap: () => Navigator.pop(context),
                    size: 35.r,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: Text(
                      title,
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
                        horizontal:
                            BorderSide(color: CustomColor.goldColor, width: 2.h)),
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
                        icon,
                        size: 68.r,
                        color: CustomColor.goldColor,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        labelText: labelText,
                        controller: controller,
                        minLines: minLines ?? 1,
                      ),
                      SizedBox(height: 10.h),
                      GenerateQrButton(
                        onTap: () async {
                          if (controller.text.isNotEmpty) {
                            final date = DateTime.now();
                            String d =
                                "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
                            context.read<ToggleProvider>().vibrate();
                            context.read<DBProvider>().addData(
                                  code: controller.text,
                                  date: date,
                                  isCreate: true,
                                );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    code: controller.text,
                                    date: d,
                                  ),
                                ));
                          } else {
                            flushBarMessage(context, "Enter required detail !");
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
    );
  }
}
