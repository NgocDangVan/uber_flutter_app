import 'package:flutter/material.dart';

class Bottomnavbarraiderprovider extends ChangeNotifier {
  int currentTab = 0;
  updateTab(int newTab) {
    currentTab = newTab;
    notifyListeners();
  }
}
