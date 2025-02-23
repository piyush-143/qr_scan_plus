import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';

class CustomSettingTile extends StatelessWidget {
  String title;
  String subtitle;
  IconData leadingIcon;
  Widget? trailing;
  CustomSettingTile(
      {required this.title,
      required this.subtitle,
      required this.leadingIcon,
      this.trailing,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(color: CustomColor.goldColor, width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColor.barBgColor,
            blurRadius: 15, blurStyle: BlurStyle.outer,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(leadingIcon),
        trailing: trailing,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        subtitleTextStyle: TextStyle(color: Colors.white70, fontSize: 13),
        tileColor: CustomColor.barBgColor,
        iconColor: CustomColor.goldColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minTileHeight: 63,
      ),
    );
  }
}
