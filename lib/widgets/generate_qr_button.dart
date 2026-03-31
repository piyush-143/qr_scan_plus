import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/core/constants/color.dart';

class GenerateQrButton extends StatelessWidget {
  final VoidCallback onTap;
  const GenerateQrButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: CustomColor.goldColor,
          borderRadius: BorderRadius.circular(7.r),
          boxShadow: [
            BoxShadow(color: CustomColor.barBgColor, blurRadius: 5.r),
            BoxShadow(color: CustomColor.bgColor, blurRadius: 5.r),
          ],
        ),
        child: Center(
          child: Text(
            'Generate QR Code',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
