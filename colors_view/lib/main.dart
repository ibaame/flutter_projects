// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import '../data.dart';
import '../models/color_info.dart';
import '../screens/apply.dart';
import '../screens/filter.dart';
import '../screens/home.dart';
import '../screens/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'cool': false,
    'warm': false,
    'main': false,
    'shade300': false,
    'shade200': false,
    'shade100': false,
  };

  Map<String, TextEditingController> _controller = {
    'shapeColor': TextEditingController(),
    'txt': TextEditingController(),
    'txtColor': TextEditingController(),
  };

  List<ColorInfo> _availableColor = colorList;

  void _receiveFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _changeFilters();
  }

  void _changeFilters() {
    setState(() {
      print("main screen");

      _availableColor = colorList.where((color) {
        if (_filters['cool'] == true && color.isCoolColor != true) {
          return false;
        }
        if (_filters['warm'] == true && color.isWarmColor != true) {
          return false;
        }
        if (_filters['main'] == true && color.isMainColor != true) {
          return false;
        }
        if (_filters['shade300'] == true && color.isShade300 != true) {
          return false;
        }
        if (_filters['shade200'] == true && color.isShade200 != true) {
          return false;
        }
        if (_filters['shade100'] == true && color.isShade100 != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Home(),
        View.routeScreen: (context) => View(_availableColor),
        Filter.routeScreen: (context) => Filter(_filters, _receiveFilters),
        Apply.routeScreen: (context) => Apply(_controller),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
