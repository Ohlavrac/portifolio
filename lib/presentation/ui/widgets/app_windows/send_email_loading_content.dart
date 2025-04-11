import 'package:flutter/material.dart';

class SendEmailLoadingContent extends StatefulWidget {
  const SendEmailLoadingContent({super.key});

  @override
  State<SendEmailLoadingContent> createState() => _SendEmailLoadingContentState();
}

class _SendEmailLoadingContentState extends State<SendEmailLoadingContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset("./assets/icons/email-icon.png"),
            Text("Send Email. . .")
          ],
        ),

      ],
    );
  }
}