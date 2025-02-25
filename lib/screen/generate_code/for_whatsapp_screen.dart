import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForWhatsappScreen extends StatefulWidget {
  const ForWhatsappScreen({super.key});

  @override
  State<ForWhatsappScreen> createState() => _ForWhatsappScreenState();
}

class _ForWhatsappScreenState extends State<ForWhatsappScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
