// ignore_for_file: prefer_const_constructors

import 'package:colors_list/screens/color_screen.dart';
import 'package:colors_list/widgets/cards/card_circle.dart';
import 'package:colors_list/widgets/cards/card_sauare.dart';
import 'package:colors_list/widgets/details/colors_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Colors",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Color(0xfff1eff1),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // ListView Row
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: listCircle(),
            ),
          ),
          // ListView Column
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: listSqr(),
            ),
          ),
        ],
      ),
    );
  }

  // create card color square and add to list
  List<CardSquare> listSqr() {
    List<CardSquare> list = [];

    for (int i = 0; i < colorList.length; i++) {
      list.add(
        CardSquare(
          color: colorList[i],
        ),
      );
    }

    return list;
  }

  // create card color circle and add to list
  List<CardCircle> listCircle() {
    List<CardCircle> list = [];

    for (int i = 0; i < colorList.length; i++) {
      list.add(
        CardCircle(
          color: colorList[i],
        ),
      );
    }

    return list;
  }
}
