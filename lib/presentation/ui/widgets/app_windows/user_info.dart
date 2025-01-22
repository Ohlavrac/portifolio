import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: TextStyle(),
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Name:\n", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "João Victor Rodrigues Carvalho")
                  ]
                )),
              ),
              DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("#0023"))
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("./assets/images/profile.png", scale: 2.5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("Computer Science - UESPI")),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("Age: 23 years"))
              ],
            )
          ],
        ),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("About Me:")),
        Text("Hello, my name is João Victor Rodrigues Carvalho I'm a software enginer from Brazil."),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("Stacks:")),
        Text("FLUTTER")
      ],
    );
  }
}