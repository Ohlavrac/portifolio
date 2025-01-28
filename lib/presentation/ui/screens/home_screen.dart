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

  List<Widget> iconsDesktop = [
    //Image.asset("./assets/icons/my-computer-icon.png", scale: 6.0,),
    Image.asset("./assets/icons/my-computer-icon-2.png", scale: 4.0),
    Image.asset("./assets/icons/my-network-icon.png", scale: 5.0),
    Icon(Icons.browse_gallery)
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
          GridView.builder(
            itemCount: iconsDesktop.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, crossAxisSpacing: 6, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
              
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(1),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconsDesktop[index],
                    Text("my-computer", style: TextStyle(color: Colors.black),)
                  ],
                ),
              );
            },
          ),
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