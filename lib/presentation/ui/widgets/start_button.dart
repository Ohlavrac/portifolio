import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback onPressed;
  final double? height;
  final double? width;

  const StartButton({super.key, required this.title, this.icon, required this.onPressed, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon == null ? Container() : icon!,
            Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}