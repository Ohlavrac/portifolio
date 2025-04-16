import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portifolio/presentation/ui/widgets/retro_elevated_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MyNetworkContent extends StatelessWidget {
  const MyNetworkContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 332,
          width: 150,
          child: Image.asset("./assets/images/my_network_image.png", fit: BoxFit.fill,),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B", fontSize: 20), child: Text("Connect with me in my networks")),
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
                  DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("joaovicrcarvalho@gmail.com")),
                  RetroElevatedButtonWidget(title: "Copy", onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: "joaovicrcarvalho@gmail.com"));
                  })
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
                height: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("LinkedIn . . . ")),
                  RetroElevatedButtonWidget(title: "Link", onPressed: () async {
                    Uri url = Uri.parse("https://www.linkedin.com/in/joaovictorrodriguescarvalho/");
                    await launchUrl(url);
                  })
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("GitHub . . . ")),
                    RetroElevatedButtonWidget(title: "Link", onPressed: () async {
                      Uri url = Uri.parse("https://github.com/ohlavrac");
                      await launchUrl(url);
                    })
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTextStyle(style: TextStyle(fontFamily: "Retro2B") ,child: Text("HackerRank . . . ")),
                  RetroElevatedButtonWidget(title: "Link", onPressed: () async {
                    Uri url = Uri.parse("https://www.hackerrank.com/profile/joaovicrcarvalho");
                    await launchUrl(url);
                  })
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}