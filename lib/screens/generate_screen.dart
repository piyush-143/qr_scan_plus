import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/screens/generate_code/for_business_screen.dart';
import 'package:qr_plus/screens/generate_code/for_contact_screen.dart';
import 'package:qr_plus/screens/generate_code/for_event_screen.dart';
import 'package:qr_plus/screens/generate_code/for_instagram_screen.dart';
import 'package:qr_plus/screens/generate_code/for_phone_screen.dart';
import 'package:qr_plus/screens/generate_code/for_text_screen.dart';
import 'package:qr_plus/screens/generate_code/for_twitter_screen.dart';
import 'package:qr_plus/screens/generate_code/for_website_screen.dart';
import 'package:qr_plus/screens/generate_code/for_whatsapp_screen.dart';
import 'package:qr_plus/screens/generate_code/for_wifi_screen.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/constants/size_data.dart';

import '../widgets/custom_social_button.dart';
import 'generate_code/for_email_screen.dart';

class GenerateScreen extends StatelessWidget {
  final List<IconData> icon = [
    Icons.text_fields,
    Icons.language,
    Icons.wifi,
    Icons.event_available,
    Icons.perm_contact_cal,
    Icons.business_sharp,
    FontAwesomeIcons.whatsapp,
    Icons.mark_email_unread,
    FontAwesomeIcons.xTwitter,
    FontAwesomeIcons.instagram,
    Icons.phone_callback,
  ];
  final List<String> text = [
    "Text",
    "Website",
    "Wi-Fi",
    "Event",
    "Contact",
    "Business",
    "WhatsApp",
    "Email",
    "Twitter",
    "Instagram",
    "Phone",
  ];
  final List<Widget> route = [
    const ForTextScreen(),
    const ForWebsiteScreen(),
    const ForWiFiScreen(),
    const ForEventScreen(),
    const ForContactScreen(),
    const ForBusinessScreen(),
    const ForWhatsappScreen(),
    const ForEmailScreen(),
    const ForTwitterScreen(),
    const ForInstagramScreen(),
    const ForPhoneScreen(),
  ];
  GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "Generate QR",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white, fontSize: 27.r),
        ),
        titleSpacing: 35.w,
        toolbarHeight: SizeData.toolBarHeight.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: CustomCrossContainer(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.close,
              size: 32.r,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 25.h),
        child: GridView.builder(
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 40.w,
            mainAxisSpacing: 60.h,
          ),
          itemBuilder: (context, index) {
            return CustomSocialButton(
                icon: icon[index],
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => route[index],
                      ));
                },
                text: text[index]);
          },
          itemCount: text.length,
        ),
      ),
    );
  }
}
