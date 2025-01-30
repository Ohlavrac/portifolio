import 'package:flutter/material.dart';

class DesktopIcon extends StatelessWidget {
  final String imageUrl;
  final double height;
  final String title;
  final VoidCallback onPressed;

  const DesktopIcon({super.key, required this.imageUrl, required this.height, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(1),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imageUrl, height: height, width: height,),
                SizedBox(height: 3),
                Text(title, style: TextStyle(color: Colors.white), maxLines: 2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}