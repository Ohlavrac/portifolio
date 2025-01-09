import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Offset endpos = Offset.zero;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Center(child: Container(color: Colors.red, height: 100, width: 10,)), 
          Positioned(
            left: endpos.dx == 0 && endpos.dy == 0 ? width/2-50 : endpos.dx,
            top: endpos.dx == 0 && endpos.dy == 0 ? height/2-50 : endpos.dy,
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
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.green,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.computer), color: Colors.black,
              
            )
          ],
        ),
      ),
    );
  }
}