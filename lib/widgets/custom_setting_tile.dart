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
        titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        subtitleTextStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 12, color: Colors.white60),
        tileColor: CustomColor.barBgColor,
        iconColor: CustomColor.goldColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minTileHeight: 64,
      ),
    );
  }
}
