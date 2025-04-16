import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/language_provider.dart';
import 'package:portifolio/presentation/providers/screen_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/attention_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/base_window.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/email_sent_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/my_network_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/send_email_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/send_email_error_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/send_email_loading_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/spotify_content.dart';
import 'package:portifolio/presentation/ui/widgets/app_windows/user_info.dart';
import 'package:portifolio/presentation/ui/widgets/desktop_icon.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';
import 'package:portifolio/utils/languages.dart';
import 'package:portifolio/utils/verify_windows_icon.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/models/icon_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Offset endpos = Offset.zero;

  DateTime date = DateTime.now();

  List<Widget> contents = [
    MyNetworkContent(),
    UserInfo(),
    Text("Ola Mundo III"),
    SendEmailContent(),
    SpotifyContent(),
    AttentionContent(),
    SendEmailLoadingContent(),
    EmailSentContent(),
    SendEmailErrorContent()
  ];

  List<IconModel> icons = [
    IconModel(id: 1, windowId: 2, imageUrl: "./assets/icons/my-computer-icon-3.png", title: "My Computer"),
    IconModel(id: 2, windowId: 1, imageUrl: "./assets/icons/my-network-icon-2.png", title: "My Network"),
    IconModel(id: 3, windowId: 4, imageUrl: "./assets/icons/email-icon.png", title: "Send Email"),
    IconModel(id: 4, windowId: 3, imageUrl: "./assets/icons/program-group-icon.png", title: "Projects"),
    IconModel(id: 5, windowId: 5, imageUrl: "./assets/icons/song-icon.png", title: "Spotify"),
  ];

  @override
  void initState() {
    super.initState();
    context.read<WindowsProvider>().initWindowsOpenList();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    var screenProvider = Provider.of<ScreenProvider>(context);
    var windowsProvider = Provider.of<WindowsProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    screenProvider.screenHeight = height;
    screenProvider.screenWidth = width;

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
                children: [
                  DesktopIcon(
                    imageUrl: icons[index].imageUrl,
                    height: icons[index].height,
                    title: icons[index].title,
                    onPressed: () async {
                      //TODO: TEMP DESABLE EMAIL WINDOW
                      if (icons[index].windowId == 4) { //WITH THIS USER SEND TO EMAIL
                        Uri url = Uri.parse("https://mailto:joaovicrcarvalho@gmail.com");
                        await launchUrl(url);
                      } else {
                        windowsProvider.openWindow(icons[index].windowId);
                        windowsProvider.windowReposition(icons[index].windowId);
                      }
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
          BaseWindow(window: windowsProvider.windowsList[5], content: contents[windowsProvider.windowsList[5].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[6], content: contents[windowsProvider.windowsList[6].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[7], content: contents[windowsProvider.windowsList[7].windowID-1]),
          BaseWindow(window: windowsProvider.windowsList[8], content: contents[windowsProvider.windowsList[8].windowID-1]),
          Visibility(visible: true, child: Container(),)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Color(0xFFbdbcbd),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StartButton(title: "Start", icon: Icon(Icons.computer, color: Colors.black,), onPressed: () {},),
            SizedBox(width: 10,),
            Container(
              height: 50,
              color: Color.fromARGB(255, 142, 142, 142),
              width: 3,
            ),
            SizedBox(width: 5,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  windowsProvider.windowsOpen.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: StartButton(
                      title: eng["titles"][windowsProvider.windowsOpen[index].title],
                      icon: Image.asset(verifyWindowIcon(windowsProvider.windowsOpen[index].title), scale: 10,),
                      onPressed: () {
                        windowsProvider.openWindow(windowsProvider.windowsOpen[index].windowID);
                      }
                    ),
                  );               
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 174, 173, 174),
                  ),
                  BoxShadow(
                    color: Color(0xFFbdbcbd),
                    spreadRadius: -2.0,
                    blurRadius: 1.0
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        languageProvider.lang == "ENG" ? languageProvider.setLangPTBR() : languageProvider.setLangENG();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(1),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(languageProvider.lang , style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "Retro2"),)
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}