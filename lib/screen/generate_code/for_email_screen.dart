import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForEmailScreen extends StatelessWidget {
  const ForEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "Email",
        labelText: "Email",
        icon: Icons.mark_email_unread,
        minLine: 1,
        onTap: () {},
      ),
    );
  }
}
