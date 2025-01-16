import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/providers/windows_positions_provider.dart';
import 'package:provider/provider.dart';

import '../window_title_bar.dart';

class BaseWindow extends StatefulWidget {
  final int windowIndex;
  final String title;
  final double windowWidth;
  final double windowHeight;

  //final Widget content;

  const BaseWindow({
    super.key, 
    required this.windowIndex, 
    required this.title, 
    required this.windowWidth, 
    required this.windowHeight, 
  });

  @override
  State<BaseWindow> createState() => _BaseWindowState();
}

class _BaseWindowState extends State<BaseWindow> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OpenWindowsProvider>(context);
    var positionProvider = Provider.of<WindowPositionProvider>(context);
    var screenProvider = Provider.of<ScreenProvider>(context);

    return Visibility(
      visible: provider.openWindows[widget.windowIndex],
      child: Positioned(
        
        left: positionProvider.windowPositions[widget.windowIndex].dx == 0 && positionProvider.windowPositions[widget.windowIndex].dy == 0 ? screenProvider.screenWidth/2-50 : positionProvider.windowPositions[widget.windowIndex].dx,
        top: positionProvider.windowPositions[widget.windowIndex].dx == 0 && positionProvider.windowPositions[widget.windowIndex].dy == 0 ? screenProvider.screenHeight/2-50 : positionProvider.windowPositions[widget.windowIndex].dy,
        
        child: Draggable(
          ignoringFeedbackPointer: false,
          feedbackOffset: Offset(100, 100),
          feedback: Container(
            height: widget.windowHeight,
            width: widget.windowWidth,
            color: Color(0xffc1c1c1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WindowTitleBar(
                  titleBarHeight: 35, 
                  titleBarWidth: widget.windowWidth-8, 
                  title: widget.title, 
                  onPressedMinimize: () {
                    setState(() {
                    });
                  },
                  onPressedMaximize: () {}, 
                  onPressedClose: () {}
                ),
                Container(
                  height: widget.windowHeight-45,
                  width: widget.windowWidth-5,
                  color: Color(0xffc1c1c1),
                  child: Container()
                )
              ],
            ),
          ),
          childWhenDragging: (Container(color: Colors.transparent, height: widget.windowHeight, width: widget.windowWidth,)),
          onDragUpdate: (details) {
            setState(() {
              positionProvider.updateWindowPostion(widget.windowIndex, details.localPosition.dx, details.localPosition.dy);
            });
          },
          onDragEnd: (details) {
            setState(() {
              positionProvider.updateWindowPostion(widget.windowIndex, details.offset.dx, details.offset.dy);
            });
          },
          child: Container(
            height: widget.windowHeight,
            width: widget.windowWidth,
            color: Color(0xffc1c1c1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WindowTitleBar(
                  titleBarHeight: 35, 
                  titleBarWidth: widget.windowWidth-8, 
                  title: widget.title, 
                  onPressedMinimize: () {
                    setState(() {
                      provider.closeWindow(widget.windowIndex);
                    });
                  },
                  onPressedMaximize: () {}, 
                  onPressedClose: () {
                    
                    setState(() {
                      provider.closeWindow(widget.windowIndex);
                      positionProvider.resetWindowPosition(widget.windowIndex);
                    });
                  }
                ),
                Container(
                  height: widget.windowHeight-45,
                  width: widget.windowWidth-5,
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