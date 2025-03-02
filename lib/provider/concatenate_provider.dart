import 'package:flutter/material.dart';

class ConcatenateProvider with ChangeNotifier {
  // String _result = '';
  // String get result => _result;
  String mergeString(List<String> strings) {
    // _result = strings.join();
    // notifyListeners();
    return strings.join();
  }
}
