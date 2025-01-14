import 'package:flutter/material.dart';

class OpenWindowsProvider extends ChangeNotifier {
  List<bool> openWindows = [false, false, false, false, false];

  void openWindow(int index) {
    openWindows[index] = true;
    notifyListeners();
  }

  void closeWindow(int index) {
    openWindows[index] = false;
    notifyListeners();
  }
}