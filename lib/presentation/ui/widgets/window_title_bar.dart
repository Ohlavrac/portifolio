import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/language_provider.dart';
import 'package:portifolio/utils/languages.dart';
import 'package:provider/provider.dart';

import 'title_bar_button.dart';

class WindowTitleBar extends StatelessWidget {
  final double titleBarHeight;
  final double titleBarWidth;

  final String title;

  final VoidCallback onPressedMinimize;
  final VoidCallback onPressedMaximize;
  final VoidCallback onPressedClose;

  final bool hasMinimizeButton;
  final bool hasMaximizeButton;
  final bool hasCloseButton;

  const WindowTitleBar({super.key, required this.titleBarHeight, required this.titleBarWidth, required this.title, required this.onPressedMinimize, required this.onPressedMaximize, required this.onPressedClose, required this.hasMinimizeButton, required this.hasMaximizeButton, required this.hasCloseButton});

  @override
  Widget build(BuildContext context) {

    var languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      height: titleBarHeight,
      width: titleBarWidth,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(style: TextStyle(fontSize: 18, color: Color(0xFFF3E9DC), fontFamily: "Retro2"), child: Text(getTitleValueByLanguageKey(languageProvider.lang, title))),
            Row(
              children: [
                hasMinimizeButton == false ? Container() : TitleBarButton(
                  onPressed: onPressedMinimize,
                  icon: Icons.minimize,
                ),
                hasMaximizeButton == false ? Container() : TitleBarButton(
                  onPressed: onPressedMaximize,
                  icon: Icons.maximize,
                ),
                hasCloseButton == false ? Container() : TitleBarButton(
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