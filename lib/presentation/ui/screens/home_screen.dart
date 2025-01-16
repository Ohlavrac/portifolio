import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/base_window.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Offset endpos = Offset.zero;
  late Offset endpos2 = Offset.zero;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    var provider = Provider.of<OpenWindowsProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFF4E6851),
      body: Stack(
        children: [
          Visibility(
            visible: provider.openWindows[0],
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
            ),
          ),
      //USER INFO
      /*Visibility(
        visible: windowsOpen[1],
        child: Positioned(
          left: endpos2.dx == 0 && endpos2.dy == 0 ? width/2-50 : endpos2.dx,
          top: endpos2.dx == 0 && endpos2.dy == 0 ? height/2-50 : endpos2.dy,
          child: Draggable(
            ignoringFeedbackPointer: false,
            dragAnchorStrategy: (draggable, context, position) {
              print("DX: ${draggable.feedbackOffset.dx + 245/2} | DY: ${draggable.feedbackOffset.dy + 305 / 2}");
              return Offset(draggable.feedbackOffset.dx, draggable.feedbackOffset.dy);
            },
            feedbackOffset: Offset(100, 100),
            feedback: Container(
              height: 245,
              width: 305,
              color: Color(0xffc1c1c1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WindowTitleBar(
                    titleBarHeight: 35, 
                    titleBarWidth: 297, 
                    title: "Playlists", 
                    onPressedMinimize: () {},
                    onPressedMaximize: () {}, 
                    onPressedClose: () {}
                  ),
                  Container(
                    height: 200,
                    width: 300,
                    color: Color(0xffc1c1c1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(style: TextStyle(fontSize: 18), child: Text("OLA SO")),
                        Text("OLA MUNDO")
                      ],
                    ),
                  )
                ],
              ),
            ),
            /*childWhenDragging: Container(
              height: 245,
              width: 305,
              color: Color(0xffc1c1c1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WindowTitleBar(
                    titleBarHeight: 35, 
                    titleBarWidth: 297, 
                    title: "User Informations", 
                    onPressedMinimize: () {},
                    onPressedMaximize: () {}, 
                    onPressedClose: () {}
                  ),
                  Container(
                    height: 200,
                    width: 300,
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
            ),*/
            childWhenDragging: (Container(color: Colors.transparent, height: 245, width: 305,)),
            child: Container(
              height: 245,
              width: 305,
              color: Color(0xffc1c1c1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WindowTitleBar(
                    titleBarHeight: 35, 
                    titleBarWidth: 297, 
                    title: "User Informations", 
                    onPressedMinimize: () {},
                    onPressedMaximize: () {}, 
                    onPressedClose: () {}
                  ),
                  Container(
                    height: 200,
                    width: 300,
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
            ),
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
        ),
      ),*/
          BaseWindow(
            windowIndex: 1,
            title: "Test Window",
            windowWidth: 500, 
            windowHeight: 600,
            screenwidth: width, 
            screenheight: height, 
          ),
          Visibility(visible: true, child: Container(),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Color(0xFFbdbcbd),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, -2)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, -2)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, 0)
                  )
                ]
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: Color(0xFFbdbcbd),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                  elevation: 0.0,
                  shadowColor: Colors.black,
                  
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.computer, color: Colors.black,),
                    Text("START", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  provider.openWindows[0] = provider.openWindows[0] == true ? false : true;
                });
              },
              icon: Icon(Icons.computer), color: Colors.black,
              
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  provider.openWindows[1] = provider.openWindows[1] == true ? false : true;
                });
              },
              icon: Icon(Icons.person, color: Colors.black,)
            )
          ],
        ),
      ),
    );
  }
}