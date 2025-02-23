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
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 10,
        children: [
          Container(
            width: 60,
            height: 60,
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
              size: 35,
              color: CustomColor.barBgColor,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
