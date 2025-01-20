import 'package:flutter/material.dart';
import 'package:portifolio/domain/models/window_model.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/providers/windows_positions_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:provider/provider.dart';

import '../window_title_bar.dart';

class BaseWindow extends StatefulWidget {
  final WindowModel window;

  //final Widget content;

  const BaseWindow({
    super.key, 
    required this.window 
  });

  @override
  State<BaseWindow> createState() => _BaseWindowState();
}

class _BaseWindowState extends State<BaseWindow> {

  @override
  Widget build(BuildContext context) {
    var positionProvider = Provider.of<WindowPositionProvider>(context);
    var screenProvider = Provider.of<ScreenProvider>(context);
    var windowsProvider = Provider.of<WindowsProvider>(context);

    return Visibility(
      visible: widget.window.isOpen,
      child: Positioned(
        
        left: positionProvider.windowPositions[widget.window.windowID].dx == 0 && positionProvider.windowPositions[widget.window.windowID].dy == 0 ? screenProvider.screenWidth/2-50 : positionProvider.windowPositions[widget.window.windowID].dx,
        top: positionProvider.windowPositions[widget.window.windowID].dx == 0 && positionProvider.windowPositions[widget.window.windowID].dy == 0 ? screenProvider.screenHeight/2-50 : positionProvider.windowPositions[widget.window.windowID].dy,
        
        child: Draggable(
          ignoringFeedbackPointer: false,
          feedbackOffset: Offset(100, 100),
          feedback: Container(
            height: widget.window.windowHeight,
            width: widget.window.windowWidth,
            color: Color(0xffc1c1c1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WindowTitleBar(
                  titleBarHeight: 35, 
                  titleBarWidth: widget.window.windowWidth-8, 
                  title: widget.window.title, 
                  onPressedMinimize: () {
                    setState(() {
                    });
                  },
                  onPressedMaximize: () {}, 
                  onPressedClose: () {}
                ),
                Container(
                  height: widget.window.windowHeight-45,
                  width: widget.window.windowWidth-5,
                  color: Color(0xffc1c1c1),
                  child: Container()
                )
              ],
            ),
          ),
          childWhenDragging: (Container(color: Colors.transparent, height: widget.window.windowHeight, width: widget.window.windowWidth,)),
          onDragUpdate: (details) {
            setState(() {
              positionProvider.updateWindowPostion(widget.window.windowID, details.localPosition.dx, details.localPosition.dy);
            });
          },
          onDragEnd: (details) {
            setState(() {
              positionProvider.updateWindowPostion(widget.window.windowID, details.offset.dx, details.offset.dy);
              windowsProvider.windowReposition(widget.window.windowID);
            });
          },
          child: Container(
            height: widget.window.windowHeight,
            width: widget.window.windowWidth,
            color: Color(0xffc1c1c1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WindowTitleBar(
                  titleBarHeight: 35, 
                  titleBarWidth: widget.window.windowWidth-8, 
                  title: widget.window.title, 
                  onPressedMinimize: () {
                    windowsProvider.closeWindow(widget.window.windowID);
                  },
                  onPressedMaximize: () {}, 
                  onPressedClose: () {
                    
                    setState(() {
                      windowsProvider.closeWindow(widget.window.windowID);
                      positionProvider.resetWindowPosition(widget.window.windowID);
                    });
                  }
                ),
                Container(
                  height: widget.window.windowHeight-45,
                  width: widget.window.windowWidth-5,
                  color: Color(0xffc1c1c1),
                  child: Container(),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}