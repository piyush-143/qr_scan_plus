import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForWebsiteScreen extends StatelessWidget {
  const ForWebsiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "Website",
        labelText: "Website Url",
        icon: Icons.language,
        minLine: 2,
        onTap: () {},
      ),
    );
  }
}
