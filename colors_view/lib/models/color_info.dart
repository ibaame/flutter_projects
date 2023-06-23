import 'package:flutter/material.dart';

class ColorInfo {
  final String name;
  final Color colorCode;
  final bool isCoolColor;
  final bool isWarmColor;
  final bool isMainColor;
  final bool isShade300;
  final bool isShade200;
  final bool isShade100;
  final String hexCodeColor;

  ColorInfo(
      {required this.isCoolColor,
      required this.isWarmColor,
      required this.isMainColor,
      required this.isShade300,
      required this.isShade200,
      required this.isShade100,
      required this.name,
      required this.colorCode,
      required this.hexCodeColor});
}
