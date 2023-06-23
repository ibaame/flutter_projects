// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class DecimalToBinary extends StatefulWidget {
  const DecimalToBinary({super.key});

  static const screenRoute = '/decimal_to_binary';

  @override
  State<DecimalToBinary> createState() => _DecimalToBinaryState();
}

class _DecimalToBinaryState extends State<DecimalToBinary> {
  final txt = TextEditingController();
  String message = "";
  String notes = "";
  String checkNotesColor = "";

  String binaryText = "";
  void textToBinary(String m) {
    // ABC => A B C
    List<String> str = m.split("");
    // A B C => 65 66 67
    List<int> dec = [];

    // convert text to decimal
    for (int i = 0; i < str.length; i++) {
      int num = str[i].codeUnits.first;
      dec.add(num);
    }

    // take each string then convert from flutter decimal to binary
    for (int i = 0; i < dec.length; i++) {
      String bin = toBinary(dec[i]);
      if (i != dec.length - 1) {
        binaryText = "$binaryText$bin ";
      } else {
        binaryText = "$binaryText$bin";
      }
    }
  }

  // convert from decimal to binary
  String toBinary(int dec) {
    String bin = '';
    while (dec > 0) {
      bin = (dec % 2).toString() + bin;
      dec = (dec / 2).floor();
    }

    return bin;
  }

  void errorTextHint() {
    if (txt.text.isEmpty) {
      notes = "لا يوجد نص لتحويله";
      checkNotesColor = 'red';
    }
  }

  void correctionTextHint() {
    checkNotesColor = 'green';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff457b9d),
        elevation: 0,
        title: Text('تحويل النص إلى باينري'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 25,
            height: 25,
            child: FloatingActionButton.small(
              backgroundColor: Color(0xff457b9d),
              elevation: 0,
              heroTag: "action-clear",
              tooltip: "تنظيف",
              hoverElevation: 0,
              highlightElevation: 0,
              onPressed: () {
                setState(() {
                  message = "";
                  binaryText = "";
                  notes = "";
                  txt.clear();
                });
              },
              child: Icon(
                Icons.clear,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff457b9d),
                    ),
                    child: Text(
                      '$binaryText',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.grey[50],
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton.small(
                      backgroundColor: Color(0xff457b9d),
                      tooltip: "نسخ النص",
                      heroTag: "action-copy",
                      hoverElevation: 0,
                      highlightElevation: 0,
                      onPressed: () {
                        setState(() {
                          Clipboard.setData(
                            ClipboardData(text: binaryText),
                          );
                          correctionTextHint();
                          notes = "تم نسخ النص";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.copy,
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton.small(
                      backgroundColor: Color(0xff457b9d),
                      tooltip: "تحويل النص",
                      heroTag: "action-convert",
                      hoverElevation: 0,
                      highlightElevation: 0,
                      onPressed: () {
                        setState(() {
                          message = "";
                          if (txt.text.isEmpty) {
                            errorTextHint();
                          } else {
                            binaryText = '';
                            correctionTextHint();
                            notes = "تم تحويل النص إلى باينري";
                            message = txt.text;
                            textToBinary(message);
                            txt.clear();
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.autorenew,
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 175,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        controller: txt,
                        cursorColor: Color(0xff457b9d),
                        decoration: InputDecoration(
                          hintText: "اكتب هنا",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff457b9d)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff457b9d)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                alignment: Alignment.bottomLeft,
                child: Text(
                  notes,
                  style: TextStyle(
                    color: checkNotesColor == "red" ? Colors.red : Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
