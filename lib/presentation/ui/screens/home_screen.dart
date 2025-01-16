import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/base_window.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';
import 'package:provider/provider.dart';

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

    var provider = Provider.of<OpenWindowsProvider>(context);
    var screenProvider = Provider.of<ScreenProvider>(context);

    screenProvider.screenHeight = height;
    screenProvider.screenWidth = width;

    return Scaffold(
      backgroundColor: Color(0xFF4E6851),
      body: Stack(
        children: [
          BaseWindow(
            windowIndex: 0,
            title: "Test Window 2",
            windowWidth: 300, 
            windowHeight: 600,
          ),
          BaseWindow(
            windowIndex: 1,
            title: "Test Window 1",
            windowWidth: 500, 
            windowHeight: 600,
          ),
          Visibility(visible: true, child: Container(),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Color(0xFFbdbcbd),
        child: Row(
          children: [
            StartButton(),
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