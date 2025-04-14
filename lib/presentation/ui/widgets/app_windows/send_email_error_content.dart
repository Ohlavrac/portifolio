import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/language_provider.dart';
import 'package:portifolio/presentation/providers/windows_provider.dart';
import 'package:portifolio/presentation/ui/widgets/retro_elevated_button_widget.dart';
import 'package:portifolio/utils/languages.dart';
import 'package:provider/provider.dart';

class SendEmailErrorContent extends StatelessWidget {
  const SendEmailErrorContent({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("./assets/icons/warning-icon.png", scale: 5,),
              SizedBox(width: 20,),
              DefaultTextStyle(
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                child: Text(getTextValueByLanguageKey(languageProvider.lang, "email_error_msg"), style: TextStyle(fontFamily: "Retro2B", fontSize: 14),)
              )
            ],
          ),
          RetroElevatedButtonWidget(
            title: "OK",
            height: 30,
            width: 50,
            onPressed: () {
              context.read<WindowsProvider>().closeWindow(9);
            }
          )
        ],
      ),
    );
  }
}