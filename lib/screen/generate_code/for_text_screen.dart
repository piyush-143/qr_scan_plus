import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForTextScreen extends StatefulWidget {
  const ForTextScreen({super.key});

  @override
  State<ForTextScreen> createState() => _ForTextScreenState();
}

class _ForTextScreenState extends State<ForTextScreen> {
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
        title: "Text",
        labelText: "Enter Text",
        icon: Icons.text_fields,
        minLine: 2,
        onTap: () {},
      ),
    );
  }
}
