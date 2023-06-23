// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/card_color.dart';
import '../models/color_info.dart';
import '../data.dart';

class View extends StatefulWidget {
  const View(this.availableTrips);

  static const routeScreen = "/view_screen";

  final List<ColorInfo> availableTrips;

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  List<ColorInfo> displayColors = [];

  @override
  void didChangeDependencies() {
    print("view screen");
    displayColors = widget.availableTrips;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("View")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: ListView.builder(
            itemCount: displayColors.length,
            itemBuilder: (context, index) {
              return CardColor(
                name: displayColors[index].name,
                colorCode: displayColors[index].colorCode,
                hexCodeColor: displayColors[index].hexCodeColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
