import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForWebsiteScreen extends StatefulWidget {
  const ForWebsiteScreen({super.key});

  @override
  State<ForWebsiteScreen> createState() => _ForWebsiteScreenState();
}

class _ForWebsiteScreenState extends State<ForWebsiteScreen> {
  TextEditingController controller = TextEditingController();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "Website",
        labelText: "Website Url",
        icon: Icons.language,
        minLine: 2,
      ),
    );
  }
}
