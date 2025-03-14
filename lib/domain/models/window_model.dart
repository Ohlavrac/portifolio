class WindowModel {
  final int windowID;
  final String title;
  late bool isOpen;
  final double windowWidth;
  final double windowHeight;
  final bool hasMinimizeButton;
  final bool hasMaximizeButton;
  final bool hasCloseButton;

  WindowModel({required this.windowID, required this.title, required this.isOpen, required this.windowWidth, required this.windowHeight, required this.hasMinimizeButton, required this.hasMaximizeButton, required this.hasCloseButton});
}