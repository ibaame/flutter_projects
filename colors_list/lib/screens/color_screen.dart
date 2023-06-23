// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Color(0xfff1eff1),
        title: Text(
          "color",
          style: TextStyle(
            color: color,
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(right: 20),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: color,
        ),
      ),
      body: SizedBox(
        child: Divider(
          color: color,
        ),
      ),
    );
  }
}
