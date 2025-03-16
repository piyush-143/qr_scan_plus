import 'package:flutter/material.dart';

class TabIndexProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;
  void setTabIndex(bool isCreate) {
    _index = isCreate ? 1 : 0;
    notifyListeners();
  }
}
