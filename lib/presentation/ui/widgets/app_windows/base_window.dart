import 'package:flutter/material.dart';

import '../window_title_bar.dart';

class BaseWindow extends StatefulWidget {
  final bool isVisible;
  final String title;
  final double windowWidth;
  final double windowHeight;
  final double screenwidth;
  final double screenheight;
  final Offset offsetPosition;

  //final Widget content;

  const BaseWindow({
    super.key, 
    required this.isVisible, 
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
    return Visibility(
      visible: widget.isVisible,
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
                  onPressedMinimize: () {},
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
                  onPressedMinimize: () {},
                  onPressedMaximize: () {}, 
                  onPressedClose: () {}
                ),
                Container(
                  height: widget.windowHeight-45,
                  width: widget.windowWidth-5,
                  color: Color(0xffc1c1c1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("OLA SO"),
                      Text("OLA MUNDO")
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}