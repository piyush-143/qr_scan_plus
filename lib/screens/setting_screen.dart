import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/toggle_provider.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/custom_setting_tile.dart';
import 'package:qr_plus/widgets/custom_switch_button.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/utils/flushbar_message.dart';
import 'package:qr_plus/core/constants/size_data.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleProvider = context.read<ToggleProvider>();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeData.aboveAppBar.h),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: CustomCrossContainer(
                  icon: Icons.arrow_back_ios_sharp,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  size: 35.r,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Settings",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18.r,
                    ),
              ),

              //SizedBox(height: 20),
              CustomSettingTile(
                title: "Vibrate",
                subtitle: "Vibration when scan is done.",
                leadingIcon: Icons.vibration,
                trailing: CustomSwitchButton(
                  val: context.watch<ToggleProvider>().canVibrate,
                  onChanged: (value) {
                    toggleProvider.toggleVibration(value);
                    if (value == true) {
                      flushBarMessage(context, "Vibration turned On");
                    } else {
                      flushBarMessage(context, "Vibration turned Off");
                    }
                  },
                ),
              ),

              SizedBox(height: 15.h),
              Text(
                "Support",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18.r,
                    ),
              ),
              const CustomSettingTile(
                title: "Rate Us",
                subtitle: "Your best reward to us.",
                leadingIcon: Icons.verified,
              ),
              const CustomSettingTile(
                title: "Privacy Policy",
                subtitle: "Follow our policies that benefits you.",
                leadingIcon: Icons.privacy_tip,
              ),
              const CustomSettingTile(
                title: "Share",
                subtitle: "Share app with others.",
                leadingIcon: Icons.share,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
