// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class BinaryToDecimal extends StatefulWidget {
  const BinaryToDecimal({super.key});

  static const screenRoute = '/binary_to_decimal';

  @override
  State<BinaryToDecimal> createState() => _BinaryToDecimalState();
}

class _BinaryToDecimalState extends State<BinaryToDecimal> {
  final txt = TextEditingController();
  String message = "";
  String notes = "";
  String checkNotesColor = "";

  String decimalText = "";
  void binaryToDecimal(String m) {
    // if text contain \n
    m = m.replaceAll("\n", " 1010 ");

    // "11 01 10" => [11, 01, 10]
    List<String> str = m.split(" ");

    // take each string then convert from decimal to binary
    for (int i = 0; i < str.length; i++) {
      String dec = toDecimal(str[i]);
      decimalText = "$decimalText$dec";
    }
  }

  // convert from decimal to binary
  String toDecimal(String bin) {
    List<String> c = bin.split("");
    int dec = 0;
    int k = bin.length - 1;
    for (int i = 0; i < bin.length; i++) {
      int p = pow(2, k) as int;
      dec = dec + (int.parse(c[i]) * p);
      k--;
    }

    return String.fromCharCode(dec);
  }

  // check if text contain only [1,0]
  bool checkText(String messagex) {
    List<String> str = messagex.split("");
    bool x = true;

    for (int i = 0; i < str.length; i++) {
      if (str[i] != '0' &&
          str[i] != '1' &&
          str[i] != ' ' &&
          str[i].codeUnits.first != 10) {
        x = false;
      }
    }
    return x;
  }

  void errorTextHint() {
    if (txt.text.isEmpty) {
      notes = "لا يوجد نص لتحويله";
    } else if (checkText(txt.text) == false) {
      notes = "يجب أن يحتوي فقط 0 أو 1";
    }
    checkNotesColor = 'red';
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
        title: Text('تحويل البانري إلى نص'),
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
                  decimalText = "";
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
                      '$decimalText',
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
                            ClipboardData(text: decimalText),
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
                          if (txt.text.isEmpty ||
                              checkText(txt.text) == false) {
                            errorTextHint();
                          } else {
                            decimalText = '';
                            correctionTextHint();
                            notes = "تم تحويل الباينري إلى نص";
                            message = txt.text;
                            binaryToDecimal(message);
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
