// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'data.dart';

int count = 3;
IconData icon = icon = Icons.border_all_rounded;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (count % 2 == 0) {
                count = 3;
                icon = Icons.border_all_rounded;
              } else {
                count = 2;
                icon = Icons.calendar_view_month_rounded;
              }
            });
          },
          child: Icon(icon)),
      appBar: AppBar(
        title: Center(
          child: const Text("أعد ترتيب الألوان",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
      ),
      body: buildGrid(),
    );
  }

  Widget buildGrid() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ReorderableGridView.count(
        crossAxisCount: count,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: gradientColors
            .map(
              (LinearGradient color) => Container(
                key: ValueKey(color),
                decoration: BoxDecoration(
                  gradient: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
            .toList(),
        onReorder: (oldIndex, newIndex) {
          LinearGradient color = gradientColors.removeAt(oldIndex);
          gradientColors.insert(newIndex, color);
          setState(() {});
        },
      ),
    );
  }
}
