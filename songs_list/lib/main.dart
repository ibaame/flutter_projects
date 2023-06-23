// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// add to pubspec.yaml under "dependencies:"=> audioplayers: ^2.0.0
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // play music from local
  // use => AudioPlayer : final player = AudioPlayer();
  // player.play(UrlSource(path));
  void playMusic(int numMusic) {
    final player = AudioPlayer();
    player.play(UrlSource("songs/music-$numMusic.mp3"));
  }

  // this function to add new music on list with change some properties (color..)
  Expanded myButton(
      {int numMusic = 0, String title = "", Color color = Colors.black}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white60)),
          onPressed: () {
            playMusic(numMusic);
          },
          child: Row(
            children: [
              Icon(
                Icons.music_note,
                color: color,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(color: color, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
            child: const Text("Songs"),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(numMusic: 1, title: "Music 1", color: Colors.white),
            myButton(numMusic: 2, title: "Music 2", color: Colors.black),
            myButton(numMusic: 3, title: "Music 3", color: Colors.blue),
            myButton(numMusic: 4, title: "Music 4", color: Colors.white),
            myButton(numMusic: 5, title: "Music 5", color: Colors.blue),
            myButton(numMusic: 6, title: "Music 6", color: Colors.black),
            myButton(numMusic: 7, title: "Music 7", color: Colors.white),
          ],
        ),
      ),
    );
  }
}
