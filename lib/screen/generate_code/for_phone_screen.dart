import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForPhoneScreen extends StatelessWidget {
  const ForPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "Phone",
        labelText: "Phone Number",
        icon: Icons.phone_callback,
        minLine: 1,
        onTap: () {},
      ),
    );
  }
}
