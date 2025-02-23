import 'package:flutter/material.dart';

import 'uihelper/color.dart';

class CustomCrossContainer extends StatelessWidget {
  double size;
  IconData icon;
  VoidCallback onTap;
  CustomCrossContainer({
    required this.icon,
    required this.onTap,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: CustomColor.barBgColor,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(color: CustomColor.barBgColor, blurRadius: 5),
            BoxShadow(color: CustomColor.bgColor, blurRadius: 7),
          ],
        ),
        child: Icon(
          icon,
          color: CustomColor.goldColor,
        ),
      ),
    );
  }
}
