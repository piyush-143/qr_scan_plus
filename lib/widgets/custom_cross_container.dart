import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/core/constants/color.dart';

class CustomCrossContainer extends StatelessWidget {
  final double size;
  final IconData icon;
  final VoidCallback onTap;
  const CustomCrossContainer({
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
        width: size.r,
        height: size.r,
        decoration: BoxDecoration(
          color: CustomColor.barBgColor,
          borderRadius: BorderRadius.circular(3.r),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(color: CustomColor.barBgColor, blurRadius: 5.r),
            BoxShadow(color: CustomColor.bgColor, blurRadius: 7.r),
          ],
        ),
        child: Icon(
          icon,
          color: CustomColor.goldColor,
          size: (size * 0.7).r, // Scale icon relative to container size
        ),
      ),
    );
  }
}
