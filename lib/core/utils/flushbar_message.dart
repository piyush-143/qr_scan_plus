import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:qr_plus/core/constants/color.dart';

Future<void> flushBarMessage(BuildContext context, String msg) {
  return Flushbar(
    message: msg,
    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    duration: const Duration(seconds: 2),
    icon: const Icon(Icons.info_outline_rounded, color: CustomColor.goldColor),
    messageSize: 15,
    backgroundColor: Colors.black54,
    shouldIconPulse: false,
    borderRadius: BorderRadius.circular(5),
    leftBarIndicatorColor: CustomColor.goldColor,
  ).show(context);
}
