import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/open_windows_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/ui/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OpenWindowsProvider(),
      child: MaterialApp(
        initialRoute: "/home",
        routes: {
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}