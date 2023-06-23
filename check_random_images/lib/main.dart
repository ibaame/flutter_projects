// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            backgroundColor: Colors.indigo[800],
            title: Row(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("لعبة التطابق"),
              ],
            ),
          ),
          body: MyApp(),
        ),
      ),
    ),
  );
}

// StatelessWidget use when app is just to view
// StatefulWidget use when app is refresh from inside app
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => StateMyApp();
}

class StateMyApp extends State<MyApp> {
  int imgL = 0;
  int imgR = 0;
  int count = 0;
  int win = 0;
  int countTotal = 0;
  int rate = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "عدد الفوز $win",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "عدد المحاولات الكلي $countTotal",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "عدد المحاولات $count",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              "نسبة الحظ %$rate",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        Text(
          check(),
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // Expanded is make flexible size of elements
            Expanded(
              // TextButton is add button to element
              child: TextButton(
                onPressed: () {
                  print("test to image of left");
                  setState(() {
                    imgL = rndm();
                    increment();
                    checkWin();
                  });
                  soundClick();
                },
                child: Image.asset("images/image-$imgL.png"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  print("test to image of right");
                  setState(() {
                    imgR = rndm();
                    increment();
                    checkWin();
                  });
                  soundClick();
                },
                child: Image.asset("images/image-$imgR.png"),
              ),
            ),
          ],
        ),
        Container(
          child: TextButton(
            onPressed: () {
              setState(() {
                print("reset of game");
                reset();
              });
            },
            child: Image.asset(
              "images/reset.png",
              width: 50,
            ),
          ),
        ),
      ],
    );
  }

  String check() {
    if (imgL == 0 && imgR == 0) {
      return "بدء اللعب";
    }
    if (imgL == imgR) {
      return "🌟 مبررووك لقد ربحت ";
    } else {
      return "حاول مرة أخرى";
    }
  }

  void checkWin() {
    if (imgL == imgR) {
      count = 0;
      win++;
      soundWin();
    }
    double x = (win / countTotal) * 100;
    rate = x.toInt();
  }

  void increment() {
    count++;
    countTotal++;
  }

  int rndm() {
    int x = 1 + Random().nextInt(9); // 1 - 9
    return x;
  }

  void soundClick() {
    final player = AudioPlayer();
    player.play(UrlSource("sounds/click.wav"));
  }

  void soundWin() {
    final player = AudioPlayer();
    player.play(UrlSource("sounds/win.wav"));
  }

  void soundReset() {
    final player = AudioPlayer();
    player.play(UrlSource("sounds/reset.wav"));
  }

  void reset() {
    imgL = 0;
    imgR = 0;
    count = 0;
    win = 0;
    countTotal = 0;
    rate = 0;
    soundReset();
  }
}
