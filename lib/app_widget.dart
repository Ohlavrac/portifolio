import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:portifolio/presentation/providers/windows_positions_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/ui/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OpenWindowsProvider(),),
        ChangeNotifierProvider(create: (_) => WindowPositionProvider())
      ],
      child: MaterialApp(
        initialRoute: "/home",
        routes: {
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}