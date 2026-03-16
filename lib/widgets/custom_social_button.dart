import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/core/constants/color.dart';

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
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(color: CustomColor.barBgColor, blurRadius: 5.r),
            BoxShadow(color: CustomColor.bgColor, blurRadius: 7.r),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 38.r,
              color: CustomColor.goldColor,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 13.r,
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
