import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_plus/widgets/single_field.dart';

import '../../widgets/uihelper/color.dart';

class ForInstagramScreen extends StatefulWidget {
  const ForInstagramScreen({super.key});

  @override
  State<ForInstagramScreen> createState() => _ForInstagramScreenState();
}

class _ForInstagramScreenState extends State<ForInstagramScreen> {
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
        title: "Instagram",
        labelText: "Username",
        icon: FontAwesomeIcons.instagram,
        minLine: 1,
        onTap: () {},
      ),
    );
  }
}
