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
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), child: Text("Software Engining")),
                SizedBox(height: 8,),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), child: Text("Education:")),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text("B.S.")),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text("Computer Science")),
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text("Universidade Estadual\nDo Piaui - UESPI")),              
                DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.normal), child: Text("Sep 2019 - Dec 2024")),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("About Me:")),
        DefaultTextStyle(style: TextStyle(), child: Text(textAlign: TextAlign.justify, "Hi, my name is João Victor, I'm 23 years old and I'm a full-stack developer with a degree in Computer Science. I've always been fascinated by the world of technology, always trying to understand how the games I played worked, which was my main motivation to start programming. I currently work as a full-stack developer and I'm always looking for a new challenge or task to put my skills into practice and to learn something new.")),
        DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: Text("Stacks:")),
        Text("FLUTTER")
      ],
    );
  }
}