import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  final String title;
  final String value;

  const CustomRowButton({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultTextStyle(style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: "Retro2B"), child: Text("$title: ",)),
        SizedBox(width: 3,),
        Container(
          height: 23,
          width: 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 232, 232, 232),
                offset: Offset(2, 2),
              ),
              BoxShadow(
                color: Color.fromARGB(255, 232, 232, 232),
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Color.fromARGB(255, 232, 232, 232),
                offset: Offset(2, 0),
              ),
              BoxShadow(
                color: Colors.black,
                offset: Offset(-2, -2)
              ),
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, -2)
              ),
              BoxShadow(
                color: Colors.black,
                offset: Offset(-2, 0)
              )
            ]
          ),
          //color: Colors.white,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              alignment:  Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
              elevation: 0.0,
              shadowColor: Colors.black,
            ),
            child: Text(value, style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Retro2")),
          )
        )
      ],
    );
  }
}