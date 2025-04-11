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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Text("SENDING EMAIL . . .", style: TextStyle(fontFamily: "Retro2B", fontSize: 14),)
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 25,
          width: 300,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Container(
                        width: 10,
                        color: Colors.blue,
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}