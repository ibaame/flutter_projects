// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardName extends StatelessWidget {
  const CardName({super.key, required this.title, required this.screenRoute});

  final String title;
  final String screenRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          Navigator.of(context).pushNamed(screenRoute);
        },
        child: Container(
          width: 250,
          height: 150,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // colors
              colors: [
                Color(0xffe63946),
                Colors.red,
              ],
              stops: [0.2, 1],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
