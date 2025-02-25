import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForTwitterScreen extends StatefulWidget {
  const ForTwitterScreen({super.key});

  @override
  State<ForTwitterScreen> createState() => _ForTwitterScreenState();
}

class _ForTwitterScreenState extends State<ForTwitterScreen> {
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
        title: "Twitter",
        labelText: "Username",
        icon: FontAwesomeIcons.xTwitter,
        minLine: 1,
        onTap: () {},
      ),
    );
  }
}
