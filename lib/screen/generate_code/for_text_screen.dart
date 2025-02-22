import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/color.dart';

class ForTextScreen extends StatelessWidget {
  const ForTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "Text",
        labelText: "Enter Text",
        icon: Icons.text_fields,
        onTap: () {},
      ),
    );
  }
}
