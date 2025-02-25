import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:qr_plus/widgets/uihelper/color.dart';

class CustomSwitchButton extends StatefulWidget {
  final ValueChanged<dynamic> onChanged;
  final bool val;
  const CustomSwitchButton({
    required this.onChanged,
    required this.val,
    super.key,
  });

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: Color.fromRGBO(253, 182, 35, 0.6),
      width: 40,
      height: 20,
      initialValue: widget.val,
      // onChanged: (value) {
      //   val = value;
      // },
      onChanged: widget.onChanged,
      inactiveColor: Colors.white24,
    );
  }
}
