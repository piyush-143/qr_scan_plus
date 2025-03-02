import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForEmailScreen extends StatefulWidget {
  const ForEmailScreen({super.key});

  @override
  State<ForEmailScreen> createState() => _ForEmailScreenState();
}

class _ForEmailScreenState extends State<ForEmailScreen> {
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
        title: "Email",
        labelText: "Email",
        icon: Icons.mark_email_unread,
        minLine: 1,
      ),
    );
  }
}
