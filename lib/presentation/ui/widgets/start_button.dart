import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
          ),
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 0),
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, -2)
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, -2)
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, 0)
          )
        ]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: Color(0xFFbdbcbd),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          elevation: 0.0,
          shadowColor: Colors.black,
          
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(Icons.computer, color: Colors.black,),
            Text("START", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}