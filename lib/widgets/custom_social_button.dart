import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'uihelper/color.dart';

class CustomSocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const CustomSocialButton({
    required this.icon,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.barBgColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(color: CustomColor.barBgColor, blurRadius: 5),
            BoxShadow(color: CustomColor.bgColor, blurRadius: 7),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 38,
              color: CustomColor.goldColor,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
