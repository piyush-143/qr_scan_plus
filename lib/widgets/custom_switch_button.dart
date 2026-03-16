import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:qr_plus/core/utils/size_config.dart';

class CustomSwitchButton extends StatelessWidget {
  final ValueChanged<dynamic> onChanged;
  final bool val;
  const CustomSwitchButton({
    required this.onChanged,
    required this.val,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: const Color.fromRGBO(253, 182, 35, 0.6),
      width: 40.w,
      height: 20.h,
      initialValue: val,
      onChanged: onChanged,
      inactiveColor: Colors.white24,
    );
  }
}
