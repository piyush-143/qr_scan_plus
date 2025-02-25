import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForPhoneScreen extends StatefulWidget {
  const ForPhoneScreen({super.key});

  @override
  State<ForPhoneScreen> createState() => _ForPhoneScreenState();
}

class _ForPhoneScreenState extends State<ForPhoneScreen> {
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
        title: "Phone",
        labelText: "Phone Number",
        icon: Icons.phone_callback,
        minLine: 1,
        onTap: () {},
      ),
    );
  }
}
