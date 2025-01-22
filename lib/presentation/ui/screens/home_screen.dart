import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/base_window.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/user_info.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Offset endpos = Offset.zero;

  List<Widget> contents = [
    Text("Ola Mundo I"),
    UserInfo(),
    Text("Ola Mundo III"),
    Text("Ola Mundo IV"),
    Text("Ola Mundo V"),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    var screenProvider = Provider.of<ScreenProvider>(context);
    var windowsProvider = Provider.of<WindowsProvider>(context);

    screenProvider.screenHeight = height;
    screenProvider.screenWidth = width;

    return Scaffold(
      backgroundColor: Color(0xFF4E6851),
      body: Stack(
        children: [
          BaseWindow(window: windowsProvider.windowsList[0], content: contents[windowsProvider.windowsList[0].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[1], content: contents[windowsProvider.windowsList[1].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[2], content: contents[windowsProvider.windowsList[2].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[3], content: contents[windowsProvider.windowsList[3].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[4], content: contents[windowsProvider.windowsList[4].windowID-1]),
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
                  windowsProvider.openWindow(1);
                  windowsProvider.windowReposition(1);
                });
              },
              icon: Icon(Icons.computer), color: Colors.black,
              
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  windowsProvider.openWindow(2);
                  windowsProvider.windowReposition(2);
                });
              },
              icon: Icon(Icons.person, color: Colors.black,)
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  windowsProvider.openWindow(3);
                  windowsProvider.windowReposition(3);
                });
              },
              icon: Icon(Icons.ac_unit, color: Colors.black,)
            )
          ],
        ),
      ),
    );
  }
}