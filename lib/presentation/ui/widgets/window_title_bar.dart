import 'package:flutter/material.dart';

import 'title_bar_button.dart';

class WindowTitleBar extends StatelessWidget {
  final double titleBarHeight;
  final double titleBarWidth;

  final String title;

  final VoidCallback onPressedMinimize;
  final VoidCallback onPressedMaximize;
  final VoidCallback onPressedClose;

  const WindowTitleBar({super.key, required this.titleBarHeight, required this.titleBarWidth, required this.title, required this.onPressedMinimize, required this.onPressedMaximize, required this.onPressedClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: titleBarHeight,
      width: titleBarWidth,
      color: const Color.fromARGB(255, 31, 28, 221),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            Row(
              children: [
                TitleBarButton(
                  onPressed: onPressedMinimize,
                  icon: Icons.minimize,
                ),
                TitleBarButton(
                  onPressed: onPressedMaximize,
                  icon: Icons.maximize,
                ),
                TitleBarButton(
                  onPressed: onPressedClose,
                  icon: Icons.close,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}