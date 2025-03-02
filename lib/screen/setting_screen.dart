import 'package:all_vibrate/all_vibrate.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/provider/toggle_provider.dart';
import 'package:qr_plus/screen/home_screen.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/custom_setting_tile.dart';
import 'package:qr_plus/widgets/custom_switch_button.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  val: context.watch<ToggleProvider>().canVibrate,
                  onChanged: (value) {
                    if (value == true) {
                      AllVibrate().simpleVibrate(period: 100, amplitude: 100);
                    }
                    context.read<ToggleProvider>().toggleVibration(value);
                  },
                ),
              ),
              CustomSettingTile(
                title: "Beep",
                subtitle: "Beep when scan is done.",
                leadingIcon: Icons.notifications_active_outlined,
                trailing: CustomSwitchButton(
                  val: context.watch<ToggleProvider>().canBeep,
                  onChanged: (value) async {
                    await player.setAsset("assets/audio/beepSound.mp3");
                    if (value == true) {
                      player.play();
                      await Future.delayed(Duration(seconds: 1));
                      player.stop();
                    }
                    context.read<ToggleProvider>().toggleBeep(value);
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
