import 'package:flutter/material.dart';

class WindowPositionProvider extends ChangeNotifier {
  List<Offset> windowPositions = [
    Offset.zero,
    Offset.zero,
    Offset.zero,
    Offset.zero,
    Offset.zero,
    Offset.zero,
  ];

  void updateWindowPostion(int index, double dx, double dy) {
    windowPositions[index] = Offset(dx, dy);
    notifyListeners();
  }

  void resetWindowPosition(int index) {
    windowPositions[index] = Offset.zero;
    notifyListeners();
  }
}