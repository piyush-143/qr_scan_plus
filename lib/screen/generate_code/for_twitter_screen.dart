import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/color.dart';

class ForTwitterScreen extends StatelessWidget {
  const ForTwitterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: SingleField(
        controller: controller,
        title: "Twitter",
        labelText: "Username",
        icon: FontAwesomeIcons.xTwitter,
        onTap: () {},
      ),
    );
  }
}
