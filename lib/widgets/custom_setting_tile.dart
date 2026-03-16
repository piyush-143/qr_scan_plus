import 'package:flutter/material.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/core/constants/color.dart';

class CustomSettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final Widget? trailing;
  const CustomSettingTile(
      {required this.title,
      required this.subtitle,
      required this.leadingIcon,
      this.trailing,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border(
          bottom: BorderSide(color: CustomColor.goldColor, width: 2.h),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColor.barBgColor,
            blurRadius: 15.r, blurStyle: BlurStyle.outer,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(leadingIcon, size: 24.r),
        trailing: trailing,
        titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 15.r,
        ),
        subtitleTextStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 12.r, color: Colors.white60),
        tileColor: CustomColor.barBgColor,
        iconColor: CustomColor.goldColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        minTileHeight: 64.h,
      ),
    );
  }
}
