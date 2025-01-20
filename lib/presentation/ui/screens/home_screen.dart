import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/base_window.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/window_model.dart';

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
    var windowsProvider = Provider.of<WindowsProvider>(context);

    screenProvider.screenHeight = height;
    screenProvider.screenWidth = width;

    return Scaffold(
      backgroundColor: Color(0xFF4E6851),
      body: Stack(
        children: [
          BaseWindow(window: windowsProvider.windowsList[0]),
          BaseWindow(window: windowsProvider.windowsList[1]),
          BaseWindow(window: windowsProvider.windowsList[2]),
          BaseWindow(window: windowsProvider.windowsList[3]),
          BaseWindow(window: windowsProvider.windowsList[4]),
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
                });
              },
              icon: Icon(Icons.computer), color: Colors.black,
              
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  windowsProvider.openWindow(2);
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