import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForWhatsappScreen extends StatelessWidget {
  const ForWhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "WhatsApp",
        labelText: "WhatsApp Number",
        icon: FontAwesomeIcons.whatsapp,
        // minLine: 1,
        onTap: () {},
      ),
    );
  }
}
