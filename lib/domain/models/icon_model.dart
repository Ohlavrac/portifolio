class IconModel {
  final int id;
  final int windowId;
  final String imageUrl;
  double height = 60;
  final String title;

  IconModel({required this.windowId, required this.id, required this.imageUrl, required this.title});
}