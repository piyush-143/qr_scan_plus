import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  int? minLine;
  CustomTextField(
      {required this.controller,
      required this.labelText,
      this.minLine,
      super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focus = FocusNode();
    return Container(
      //height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: CustomColor.barBgColor,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focus,
        maxLines: 3,
        minLines: minLine ?? 1,
        style: TextStyle(color: Colors.white, fontSize: 18),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white38, width: 1.3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white38, width: 1.3),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        cursorColor: Colors.white38,
        onTapOutside: (event) {
          focus.unfocus();
        },
      ),
    );
  }
}

class RowTextField extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String labelText1;
  final String labelText2;
  const RowTextField({
    required this.controller1,
    required this.controller2,
    required this.labelText1,
    required this.labelText2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        Expanded(
            child: CustomTextField(
                controller: controller1, labelText: labelText1)),
        Expanded(
            child:
                CustomTextField(controller: controller2, labelText: labelText2))
      ],
    );
  }
}
