import 'package:flutter/material.dart';

class OvalBg extends StatefulWidget {
  Widget body;
  OvalBg({super.key, required this.body});

  @override
  State<OvalBg> createState() => _OvalBgState();
}

class _OvalBgState extends State<OvalBg> {
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
        widget.body,
      ],
    );
  }
}
