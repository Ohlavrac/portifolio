import 'package:flutter/material.dart';
import 'package:portifolio/presentation/ui/widgets/retro_elevated_button_widget.dart';

class MyNetworkContent extends StatelessWidget {
  const MyNetworkContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          color: Colors.red,
          height: 250,
          width: 150,
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B", fontSize: 20), child: Text("Connect with me with my networks")),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  color: Colors.black,
                  height: 3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("LinkedIn . . . ")),
                  RetroElevatedButtonWidget(title: "Link", onPressed: () {})
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("GitHub . . . ")),
                    RetroElevatedButtonWidget(title: "Link", onPressed: () {})
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("HackerRank . . . ")),
                  RetroElevatedButtonWidget(title: "Link", onPressed: () {})
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}