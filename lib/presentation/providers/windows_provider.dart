import 'package:flutter/material.dart';

import '../../domain/models/window_model.dart';

class WindowsProvider extends ChangeNotifier {
  List<WindowModel> windowsList = [
    WindowModel(
      windowID: 1,
      title: "Test Window I",
      isOpen: false,
      windowWidth: 300, 
      windowHeight: 300,
    ),
    WindowModel(
      windowID: 2,
      title: "Informations",
      isOpen: true,
      windowWidth: 400, 
      windowHeight: 600,
    ),
    WindowModel(
      windowID: 3,
      title: "Test Window III",
      isOpen: false,
      windowWidth: 400, 
      windowHeight: 600,
    ),
    WindowModel(
      windowID: 4,
      title: "Send Email",
      isOpen: false,
      windowWidth: 400, 
      windowHeight: 500,
    ),
    WindowModel(
      windowID: 5,
      title: "Test Window V",
      isOpen: false,
      windowWidth: 500, 
      windowHeight: 600,
    ),
  ];

  void openWindow(int windowId) {
    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].windowID == windowId) {
        windowsList[index].isOpen = true;
      }
    }

    notifyListeners();
  }

  void closeWindow(int windowId) {
    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].windowID == windowId) {
        windowsList[index].isOpen = false;
      }
    }

    notifyListeners();
  }

  void windowReposition(int windowId) {
    late WindowModel aux;

    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].windowID == windowId) {
        aux = windowsList[index];
      }
    }

    windowsList.remove(aux);
    windowsList.add(aux);

    notifyListeners();
  }
}