import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../screen/generate_screen.dart';
import 'oval_bg.dart';
import 'uihelper/color.dart';
import 'custom_cross_container.dart';
import 'custom_text_field.dart';
import 'generate_qr_button.dart';

class SingleField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String labelText;
  final VoidCallback onTap;
  final IconData icon;
  int? minLine;
  SingleField({
    required this.controller,
    required this.title,
    required this.labelText,
    required this.onTap,
    required this.icon,
    this.minLine,
    super.key,
  });

  @override
  State<SingleField> createState() => _SingleFieldState();
}

class _SingleFieldState extends State<SingleField> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

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
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenerateScreen(),
                          ));
                    },
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeData.belowAppBar),
            Container(
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
                    widget.icon,
                    size: 68,
                    color: CustomColor.goldColor,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    labelText: widget.labelText,
                    controller: widget.controller,
                    minLine: widget.minLine ?? 1,
                  ),
                  SizedBox(height: 10),
                  GenerateQrButton(onTap: widget.onTap),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
