import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(create: (_) => WindowPositionProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
        ChangeNotifierProvider(create: (context) => WindowsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: {
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}