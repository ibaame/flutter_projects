// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.title, this.age = 20});

  static const routeScreen = '/counter_screen';
  final String title;
  final int age; // value is 29 , passed from constructor

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int age = 0; // default value

  @override
  void initState() {
    age = widget.age; // new value (value from constructor)
    print("initState = $age");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    
    print("didChangeDependencies $age");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "result",
              style: TextStyle(fontSize: 34),
            ),
            Text(
              "$age",
              style: TextStyle(fontSize: 26, color: Colors.black54),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            age++;
            print(age);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
