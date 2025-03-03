import 'package:flutter/material.dart';

import 'uihelper/color.dart';

class CustomShareSaveButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const CustomShareSaveButton({
    required this.icon,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: CustomColor.goldColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(color: CustomColor.barBgColor, blurRadius: 3),
                BoxShadow(color: CustomColor.bgColor, blurRadius: 3),
              ],
            ),
            child: Icon(
              icon,
              size: 30,
              color: CustomColor.barBgColor,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}
