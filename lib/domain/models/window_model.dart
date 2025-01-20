class WindowModel {
  final int windowID;
  final String title;
  late bool isOpen;
  final double windowWidth;
  final double windowHeight;

  WindowModel({required this.windowID, required this.title, required this.isOpen, required this.windowWidth, required this.windowHeight});
}