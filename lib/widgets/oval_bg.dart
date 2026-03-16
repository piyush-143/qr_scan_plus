import 'package:flutter/material.dart';

class OvalBg extends StatelessWidget {
  final Widget body;
  const OvalBg({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            "assets/bg/upperOval.png",
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            "assets/bg/lowerOval.png",
          ),
        ),
        body,
      ],
    );
  }
}
