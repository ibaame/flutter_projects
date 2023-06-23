// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardColor extends StatefulWidget {
  const CardColor(
      {super.key,
      required this.name,
      required this.colorCode,
      required this.hexCodeColor});

  final String name;
  final Color colorCode;
  final String hexCodeColor;

  @override
  State<CardColor> createState() => _CardColorState();
}

class _CardColorState extends State<CardColor> {
  int check = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            Clipboard.setData(
              ClipboardData(text: widget.hexCodeColor),
            );
            check = 1;
          });
        },
        child: Center(
          child: Text(
            check == 0 ? widget.name : "Copied!!",
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.colorCode,
      ),
    );
  }
}
