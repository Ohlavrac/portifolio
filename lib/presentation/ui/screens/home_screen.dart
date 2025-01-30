import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/base_window.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/user_info.dart';
import 'package:portifolio/presentation/ui/widgets/desktop_icon.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/icon_model.dart';

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
    Image.asset("./assets/icons/my-computer-icon.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),
    Image.asset("./assets/icons/my-network-icon-2.png", height: 60,),

  ];

  List<IconModel> icons = [
    IconModel(id: 1, windowId: 2, imageUrl: "./assets/icons/my-computer-icon-3.png", title: "my computer"),
    IconModel(id: 2, windowId: 1, imageUrl: "./assets/icons/my-network-icon-2.png", title: "my network"),
    IconModel(id: 3, windowId: 4, imageUrl: "./assets/icons/email-icon.png", title: "my email"),
    IconModel(id: 4, windowId: 3, imageUrl: "./assets/icons/msn-icon.png", title: "MSN"),
    IconModel(id: 5, windowId: 5, imageUrl: "./assets/icons/song-icon.png", title: "playlists"),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    var screenProvider = Provider.of<ScreenProvider>(context);
    var windowsProvider = Provider.of<WindowsProvider>(context);

    screenProvider.screenHeight = height;
    screenProvider.screenWidth = width;

    print("Altura: ${height} | icons*70 ${iconsDesktop.length * 100 + 70}");

    return Scaffold(
      backgroundColor: Color(0xFF4E6851),
      body: Stack(
        children: [
          GridView.builder(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            itemCount: icons.length,
            //gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100, crossAxisSpacing: 6, mainAxisSpacing: 5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisExtent: 100),
            itemBuilder: (context, index) {
              return Wrap(
                direction: Axis.horizontal,
                //verticalDirection: VerticalDirection.up,
                children: [
                  DesktopIcon(
                    imageUrl: icons[index].imageUrl,
                    height: icons[index].height,
                    title: icons[index].title,
                    onPressed: () {
                      setState(() {
                        windowsProvider.openWindow(icons[index].windowId);
                        windowsProvider.windowReposition(icons[index].windowId);
                      });
                    },
                  ),
                ],
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