import 'package:flutter/material.dart';

class TitleBarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const TitleBarButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(30, 30),
          maximumSize:  Size(30, 30),
          backgroundColor: Color(0xffc1c1c1),
          iconSize: 30,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1)
          )
        ),
        child: Icon(icon, size: 20, color: Colors.black,),
      ),
    );
  }
}