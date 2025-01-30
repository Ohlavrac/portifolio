import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/email_provider.dart';
import 'package:portifolio/presentation/providers/windows_positions_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/screen_provider.dart';
import 'presentation/ui/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WindowPositionProvider()),
        ChangeNotifierProvider(create: (context) => ScreenProvider()),
        ChangeNotifierProvider(create: (context) => WindowsProvider()),
        ChangeNotifierProvider(create: (context) => EmailProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => HomeScreen(),
        },
      ),
    );
  }
}