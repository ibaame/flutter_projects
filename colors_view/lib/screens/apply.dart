// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class Apply extends StatefulWidget {
  static const routeScreen = '/counter_screen';

  final Map<String, TextEditingController> currentController;

  Apply(this.currentController);

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  var shapeColor = TextEditingController();
  var txt = TextEditingController();
  var txtColor = TextEditingController();

  int _codeShape = 0xffffffff;
  int _codeText = 0xffffffff;
  String message = "";

  @override
  void initState() {
    shapeColor =
        widget.currentController['shapeColor'] as TextEditingController;
    txt = widget.currentController['txt'] as TextEditingController;
    txtColor = widget.currentController['txtColor'] as TextEditingController;
    super.initState();
  }

  void editColor() {
    _codeShape = int.parse("0xff" + shapeColor.text);
    _codeText = int.parse("0xff" + txtColor.text);
    message = txt.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Color"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: shapeColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Color of shape",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txt,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "message",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Color of message",
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(_codeText)),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(_codeShape),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            editColor();
          });
        },
        child: Icon(Icons.ads_click),
      ),
    );
  }
}
