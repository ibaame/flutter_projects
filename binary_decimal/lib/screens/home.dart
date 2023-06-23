// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens/decimal_to_binary.dart';
import '../screens/binary_to_decimal.dart';
import '../widgets/card_name.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1faee),
      appBar: AppBar(
        backgroundColor: Color(0xff457b9d),
        elevation: 0,
        title: Center(
            child: Text(
          "تحويل النصوص",
          style: TextStyle(fontSize: 24),
        )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardName(
                title: "تحويل النص إلى باينري",
                screenRoute: DecimalToBinary.screenRoute,
              ),
              CardName(
                title: "تحويل الباينري إلى نص",
                screenRoute: BinaryToDecimal.screenRoute,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
