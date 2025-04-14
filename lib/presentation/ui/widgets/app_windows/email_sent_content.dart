import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/retro_elevated_button_widget.dart';
import 'package:provider/provider.dart';

class EmailSentContent extends StatelessWidget {
  const EmailSentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("./assets/icons/email-icon.png", scale: 5,),
              SizedBox(width: 20,),
              DefaultTextStyle(
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                child: Text("EMAIL SENT SUCCESSFULLY", style: TextStyle(fontFamily: "Retro2B", fontSize: 14),)
              )
            ],
          ),
          RetroElevatedButtonWidget(
            title: "OK",
            height: 30,
            width: 50,
            onPressed: () {
              context.read<WindowsProvider>().closeWindow(8);
            }
          )
        ],
      ),
    );
  }
}