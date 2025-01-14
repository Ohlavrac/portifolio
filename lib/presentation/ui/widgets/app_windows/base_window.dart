import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:provider/provider.dart';

import '../window_title_bar.dart';

class BaseWindow extends StatefulWidget {
  final int windowIndex;
  final String title;
  final double windowWidth;
  final double windowHeight;
  final double screenwidth;
  final double screenheight;
  final Offset offsetPosition;

  //final Widget content;

  const BaseWindow({
    super.key, 
    required this.windowIndex, 
    required this.title, 
    required this.windowWidth, 
    required this.windowHeight, 
    required this.screenwidth,
    required this.screenheight, 
    required this.offsetPosition
  });

  @override
  State<BaseWindow> createState() => _BaseWindowState();
}

class _BaseWindowState extends State<BaseWindow> {
  Offset pos = Offset.zero;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OpenWindowsProvider>(context);
    return Visibility(
      visible: provider.openWindows[widget.windowIndex],
      child: Positioned(
        left: pos.dx == 0 && pos.dy == 0 ? widget.screenwidth/2-50 : pos.dx,
        top: pos.dx == 0 && pos.dy == 0 ? widget.screenheight/2-50 : pos.dy,
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
                      //isNOTMinimizi == true ? isNOTMinimizi = false : isNOTMinimizi = true;
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
              pos = details.localPosition;
            });
          },
          onDragEnd: (details) {
            setState(() {
              pos = details.offset;
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
                      
                    });
                  },
                  onPressedMaximize: () {}, 
                  onPressedClose: () {
                    setState(() {
                      provider.closeWindow(widget.windowIndex);
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