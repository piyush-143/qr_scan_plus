import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/screen/generate_code/for_business_screen.dart';
import 'package:qr_plus/screen/generate_code/for_contact_screen.dart';
import 'package:qr_plus/screen/generate_code/for_event_screen.dart';
import 'package:qr_plus/screen/generate_code/for_instagram_screen.dart';
import 'package:qr_plus/screen/generate_code/for_phone_screen.dart';
import 'package:qr_plus/screen/generate_code/for_text_screen.dart';
import 'package:qr_plus/screen/generate_code/for_twitter_screen.dart';
import 'package:qr_plus/screen/generate_code/for_website_screen.dart';
import 'package:qr_plus/screen/generate_code/for_whatsapp_screen.dart';
import 'package:qr_plus/screen/generate_code/for_wifi_screen.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

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
    // Icons.share_location,
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
    // "Location",
    "WhatsApp",
    "Email",
    "Twitter",
    "Instagram",
    "Phone",
  ];
  final List<Widget> route = [
    ForTextScreen(),
    ForWebsiteScreen(),
    ForWiFiScreen(),
    ForEventScreen(),
    ForContactScreen(),
    ForBusinessScreen(),
    //ForLocationScreen(),
    ForWhatsappScreen(),
    ForEmailScreen(),
    ForTwitterScreen(),
    ForInstagramScreen(),
    ForPhoneScreen(),
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
              .copyWith(color: Colors.white, fontSize: 27),
        ),
        titleSpacing: 35,
        toolbarHeight: SizeData.toolBarHeight,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: CustomCrossContainer(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.close,
              size: 32,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: GridView.builder(
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 60,
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
          //padding: EdgeInsets.all(30),
        ),
      ),
    );
  }
}
