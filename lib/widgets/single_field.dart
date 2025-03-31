import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/toggle_provider.dart';
import 'package:qr_plus/screen/result_screen.dart';
import 'package:qr_plus/widgets/uihelper/flushbar_message.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../provider/db_provider.dart';
import 'custom_cross_container.dart';
import 'custom_text_field.dart';
import 'generate_qr_button.dart';
import 'oval_bg.dart';
import 'uihelper/color.dart';

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
                    onTap: () => Navigator.pop(context),
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeData.belowAppBar),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: CustomColor.barBgColor.withAlpha(150),
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(color: CustomColor.goldColor, width: 2)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColor.barBgColor,
                        blurRadius: 8,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: 22,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        icon,
                        size: 68,
                        color: CustomColor.goldColor,
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        labelText: labelText,
                        controller: controller,
                        minLines: minLines ?? 1,
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 8),
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
