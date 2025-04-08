import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/email_provider.dart';
import 'package:portifolio/presentation/providers/language_provider.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';
import 'package:portifolio/presentation/ui/widgets/text_input.dart';
import 'package:portifolio/utils/languages.dart';
import 'package:provider/provider.dart';

class SendEmailContent extends StatefulWidget {
  const SendEmailContent({super.key});

  @override
  State<SendEmailContent> createState() => _SendEmailContentState();
}

class _SendEmailContentState extends State<SendEmailContent> {

  @override
  Widget build(BuildContext context) {

    var emailProvider = Provider.of<EmailProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Retro2B"), child: Text("${getValueByLangAndKey(languageProvider.lang, "your_message")}:")),
          ),
          TextInput(
            initialValue: emailProvider.message,
            maxLines: 10,
            onChanged: (value) {
              emailProvider.setMessage(value);
            },
            onSubmited: (value) {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Retro2B"), child: Text("${getValueByLangAndKey(languageProvider.lang, "your_email")}:")),
          ),
          TextInput(
            initialValue: emailProvider.email,
            maxLines: 1,
            onChanged: (value) {
              emailProvider.setEmail(value);
            },
            onSubmited: (value) {},
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*ElevatedButton(
                onPressed: () {
                  print("${emailProvider.email} | ${emailProvider.message}");
                  setState(() {
                    emailProvider.clearFields();
                  });    
                }, 
                child: Text("SEND EMAIL")
              )*/
              StartButton(
                title: "Send",
                onPressed: () {
                  emailProvider.sendEmail(
                    email: emailProvider.email,
                    name: "PORTIFOLIO EMAIL",
                    message: emailProvider.message,
                    title: "EMAIL FROM PORTIFOLIO"
                  );

                  setState(() {
                    emailProvider.clearFields();
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}