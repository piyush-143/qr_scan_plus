import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/core/constants/color.dart';

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
      spacing: 10.h,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 58.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: CustomColor.goldColor,
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(color: CustomColor.barBgColor, blurRadius: 3.r),
                BoxShadow(color: CustomColor.bgColor, blurRadius: 3.r),
              ],
            ),
            child: Icon(
              icon,
              size: 30.r,
              color: CustomColor.barBgColor,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontSize: 18.r,
              ),
        ),
      ],
    );
  }
}
