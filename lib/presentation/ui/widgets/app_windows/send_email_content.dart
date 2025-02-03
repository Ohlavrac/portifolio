import 'package:flutter/material.dart';
import 'package:portifolio/presentation/providers/email_provider.dart';
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

    String email = "";
    String message = "";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("Your Message:")),
          ),
          Material(
            child: TextFormField(
              initialValue: emailProvider.message,
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              maxLines: 10,
              onChanged: (value) {
                emailProvider.setMessage(value);
              },
              onFieldSubmitted: (value) {},
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("Your Email:")),
          ),
          Material(
            child: TextFormField(
              initialValue: emailProvider.email,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                emailProvider.setEmail(value);
              },
              onFieldSubmitted: (value) {},
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print("${emailProvider.email} | ${emailProvider.message}");
                  setState(() {
                    emailProvider.clearFields();
                  });    
                }, 
                child: Text("SEND EMAIL")
              )
            ],
          )
        ],
      ),
    );
  }
}