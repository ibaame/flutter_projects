// ignore_for_file: prefer_const_constructors

import 'package:colors_list/screens/color_screen.dart';
import 'package:flutter/material.dart';

class CardCircle extends StatelessWidget {
  const CardCircle({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: color,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ColorScreen(
                  color: color,
                ),
              ),
            );
          },
          child: const Text(
            "",
          ),
        ),
      ),
    );
  }
}
