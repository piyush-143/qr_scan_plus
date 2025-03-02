import 'package:flutter/material.dart';

TextEditingController concatenateString(List<TextEditingController> string) {
  TextEditingController result = TextEditingController();
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < string.length; i++) {
    buffer.write(string[i].text);
    if (i < string.length - 1) {
      buffer.write(", ");
    }
  }
  result.text = buffer.toString();
  return result;
}
