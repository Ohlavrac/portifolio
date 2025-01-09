import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Offset endpos = Offset.zero;
  late Offset endpos2 = Offset.zero;

  List<bool> windowsOpen = [
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: windowsOpen[0],
            child: Positioned(
              left: endpos.dx == 0 && endpos.dy == 0 ? width/2+100 : endpos.dx,
              top: endpos.dx == 0 && endpos.dy == 0 ? height/2 : endpos.dy,
              child: Draggable(
                //feedbackOffset: endpos,
                feedback: (Container(color: Colors.orange, height: 100, width: 100,)),
                child: (Container(color: Colors.orange, height: 100, width: 100,)),
                childWhenDragging: (Container(color: Colors.transparent, height: 100, width: 100)),
                onDragUpdate: (details) {
                  setState(() {
                    endpos = details.localPosition;
                  });
                },
                onDragEnd: (details) {
                  print(endpos);
                  endpos = details.offset;
                  setState(() {
                    
                  });
                },
              ),
            )),
      Visibility(
            visible: false,
            child: Positioned(
              left: endpos2.dx == 0 && endpos2.dy == 0 ? width/2-50 : endpos2.dx,
              top: endpos2.dx == 0 && endpos2.dy == 0 ? height/2-50 : endpos2.dy,
              child: Draggable(
                //feedbackOffset: endpos2,
                feedback: (Container(color: Colors.black, height: 100, width: 100,)),
                child: (Container(color: Colors.black, height: 100, width: 100,)),
                childWhenDragging: (Container(color: Colors.transparent, height: 100, width: 100)),
                onDragUpdate: (details) {
                  setState(() {
                    endpos2 = details.localPosition;
                  });
                },
                onDragEnd: (details) {
                  print(endpos2);
                  endpos2 = details.offset;
                  setState(() {
                    
                  });
                },
              ),
            )),
          Visibility(visible: true, child: Container(),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.green,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  windowsOpen[0] = true;
                  endpos = Offset.zero;
                });
                print(windowsOpen);
              },
              icon: Icon(Icons.computer), color: Colors.black,
              
            )
          ],
        ),
      ),
    );
  }
}