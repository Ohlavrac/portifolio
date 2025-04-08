import 'package:flutter/material.dart';
import 'package:portifolio/presentation/ui/widgets/custom_row_button.dart';
import 'package:portifolio/presentation/ui/widgets/start_button.dart';

class SpotifyContent extends StatelessWidget {
  const SpotifyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: Image.asset("./assets/images/spotify_retro.png", fit: BoxFit.fill),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowButton(title: "Account", value: "Ohlavrac"),
              SizedBox(height: 10,),
              CustomRowButton(title: "Playlists", value: "Spotify Playlists"),
              SizedBox(height: 5,),
              Material(
                color: Color(0xffc1c1c1),
                child: SizedBox(
                  width: 325,
                  child: Slider(
                    min: 0.0,
                    max: 100,
                    value: 45,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    thumbColor: Colors.grey,
                    onChanged: (value) {}
                  ),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10,
                children: [
                    StartButton(
                      icon: Icon(Icons.fast_rewind, color: Colors.black,),
                      title: "", 
                      onPressed: () {},
                      height: 20,
                      //width: 30,
                    ),
                    StartButton(
                      icon: Icon(Icons.fast_forward, color: Colors.black,),
                      title: "", 
                      onPressed: () {},
                      height: 20,
                      //width: 30,
                    ),
                    StartButton(
                      icon: Icon(Icons.play_arrow, color: Colors.black,),
                      title: "", 
                      onPressed: () {},
                      height: 20,
                      //width: 30,
                    ),
                    StartButton(
                      icon: Icon(Icons.stop, color: Colors.black,),
                      title: "", 
                      onPressed: () {},
                      height: 20,
                      //width: 30,
                    ),
                    StartButton(
                      icon: Icon(Icons.circle, color: Colors.black,),
                      title: "", 
                      onPressed: () {},
                      height: 20,
                      //width: 30,
                    ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}