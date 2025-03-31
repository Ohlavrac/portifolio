import 'package:flutter/material.dart';

import '../../domain/models/window_model.dart';

class WindowsProvider extends ChangeNotifier {
  List<WindowModel> windowsList = [
    WindowModel(
      windowID: 1,
      title: "my_network_title",
      isOpen: false,
      isMinimized: false,
      windowWidth: 300, 
      windowHeight: 300,
      hasCloseButton: true,
      hasMinimizeButton: true,
      hasMaximizeButton: true
    ),
    WindowModel(
      windowID: 2,
      title: "informations_title",
      isOpen: true,
      isMinimized: false,
      windowWidth: 400, 
      windowHeight: 600,
      hasCloseButton: true,
      hasMinimizeButton: true,
      hasMaximizeButton: true
    ),
    WindowModel(
      windowID: 3,
      title: "social_title",
      isOpen: false,
      isMinimized: false,
      windowWidth: 400, 
      windowHeight: 600,
      hasCloseButton: true,
      hasMinimizeButton: true,
      hasMaximizeButton: true
    ),
    WindowModel(
      windowID: 4,
      title: "send_email_title",
      isOpen: false,
      isMinimized: false,
      windowWidth: 400, 
      windowHeight: 500,
      hasCloseButton: true,
      hasMinimizeButton: true,
      hasMaximizeButton: true
    ),
    WindowModel(
      windowID: 5,
      title: "spotify_title",
      isOpen: false,
      isMinimized: false,
      windowWidth: 530, 
      windowHeight: 250,
      hasCloseButton: true,
      hasMinimizeButton: true,
      hasMaximizeButton: true
    ),
    WindowModel(
      windowID: 6,
      title: "warning_title",
      isOpen: true,
      isMinimized: false,
      windowWidth: 370,
      windowHeight: 200,
      hasCloseButton: true,
      hasMinimizeButton: false,
      hasMaximizeButton: false
    )
  ];

  List<WindowModel> windowsOpen = [];

  void openWindow(int windowId) {
    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].windowID == windowId) {
        windowsList[index].isOpen == true ? null : windowsList[index].isOpen = true;
        windowsList[index].isMinimized = false;
        addWindowOpenToWindowsOpenList(windowsList[index]);
      }
    }

    notifyListeners();
  }

  void closeWindow(int windowId) {
    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].windowID == windowId) {
        windowsList[index].isOpen = false;
        windowsList[index].isMinimized == true ? null : removeWindowToWindowsOpenList(windowsList[index]);
      }
    }
    notifyListeners();
  }

  void minimizeWindow(int windowId) {
    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].windowID == windowId) {
        windowsList[index].isMinimized = true;
      }
    }
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

  void initWindowsOpenList() {
    for (int index = 0; index < windowsList.length; index++) {
      if (windowsList[index].isOpen) {
        windowsOpen.add(windowsList[index]);
      } else {
        continue;
      }
    }
  }

  void addWindowOpenToWindowsOpenList(WindowModel window) {
    
    if (!windowsOpen.contains(window)) {
      print(window.title);
      windowsOpen.add(window);
    }

    notifyListeners();
  }

  void removeWindowToWindowsOpenList(WindowModel window) {
    if (windowsOpen.contains(window)) {
      windowsOpen.remove(window);
    }

    notifyListeners();
  }
}