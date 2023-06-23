// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  // main is main function(to run app)
  // MaterialApp: is styles exist (widgets) of vendor(google)
  // home parameter is variable
  // text is child from MaterialApp
  // text is child from center from MaterialApp, and so on..
  // if we add comma , after each brackets do new line

  runApp(
    // ignore: prefer_const_constructors
    MaterialApp(
      // Scaffold widget is widget from MaterialApp is use to divide screen
      // read documents of flutter
      home: Scaffold(
        // add AppBar to App
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          // property like title..
          title: Text("Welcome to page number of ${rndm()}"),
          // background of element
          backgroundColor: Colors.blue[900],
        ),
        // body of App: inside body we have lot of properties like Image(from local, network...)
        body: Center(
          child: Image(
            // if we want add images from device we need add assets to pubspec.ymal
            image: AssetImage("images/night.jpg"),
          ),
        ),
      ),
    ),
  );
}

int rndm() {
  int x = 1 + Random().nextInt(10);
  return x;
}
