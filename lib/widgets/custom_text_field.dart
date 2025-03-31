import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int? minLines;
  final bool isRequired;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    this.minLines,
    this.isRequired = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: CustomColor.barBgColor,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLines: 3,
        minLines: minLines ?? 1,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white38, width: 1.3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white38, width: 1.3),
          ),
          label: Row(
            children: [
              Text(
                labelText,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
              if (isRequired)
                const Text(
                  " *",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
            ],
          ),
        ),
        cursorColor: Colors.white38,
        onTapOutside: (_) => focusNode.unfocus(),
      ),
    );
  }
}

class RowTextField extends StatelessWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String labelText1;
  final String labelText2;
  final bool isRequired1;
  final bool isRequired2;

  const RowTextField({
    required this.controller1,
    required this.controller2,
    required this.labelText1,
    required this.labelText2,
    this.isRequired1 = true,
    this.isRequired2 = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller1,
            labelText: labelText1,
            isRequired: isRequired1,
          ),
        ),
        Expanded(
          child: CustomTextField(
            controller: controller2,
            labelText: labelText2,
            isRequired: isRequired2,
          ),
        ),
      ],
    );
  }
}
