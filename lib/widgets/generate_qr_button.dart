import 'package:flutter/material.dart';

import 'uihelper/color.dart';

class GenerateQrButton extends StatelessWidget {
  final VoidCallback onTap;
  const GenerateQrButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 42,
        decoration: BoxDecoration(
          color: CustomColor.goldColor,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(color: CustomColor.barBgColor, blurRadius: 5),
            BoxShadow(color: CustomColor.bgColor, blurRadius: 5),
          ],
        ),
        child: Center(
          child: Text(
            "Generate QR Code",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
