import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_plus/screen/home_screen.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/custom_setting_tile.dart';
import 'package:qr_plus/widgets/custom_switch_button.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool vibVal = true;
    bool beepVal = false;
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeData.aboveAppBar),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CustomCrossContainer(
                  icon: Icons.arrow_back_ios_sharp,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  size: 35,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Settings",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
              ),

              //SizedBox(height: 20),
              CustomSettingTile(
                title: "Vibrate",
                subtitle: "Vibration when scan is done.",
                leadingIcon: Icons.vibration,
                trailing: CustomSwitchButton(
                  val: vibVal,
                  onChanged: (value) {
                    vibVal = value;
                  },
                ),
              ),
              CustomSettingTile(
                title: "Beep",
                subtitle: "Beep when scan is done.",
                leadingIcon: Icons.notifications_active_outlined,
                trailing: CustomSwitchButton(
                  val: beepVal,
                  onChanged: (value) {
                    beepVal = value;
                  },
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Support",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
              ),
              CustomSettingTile(
                title: "Rate Us",
                subtitle: "Your best reward to us.",
                leadingIcon: Icons.verified,
              ),
              CustomSettingTile(
                title: "Privacy Policy",
                subtitle: "Follow our policies that benefits you.",
                leadingIcon: Icons.privacy_tip,
              ),
              CustomSettingTile(
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
