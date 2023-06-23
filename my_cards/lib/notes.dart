// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// to use "hot reload" most use => StatelessWidget
// hot reload is like faster refresh
// to use "StatelessWidget" can use this shortcut => stlss
// after use Stateless app become in build method
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Container> a = createBox(5);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[700],
        // SafeArea is widget to make elements inside area of app
        body: SafeArea(
          // container is widget has only one child
          // container is like div in css
          // child is take : text , image...

          // Column ^ or Row >
          // Column or Row is widget has more than one container
          child: Column(
            // main axis size : size of column or row (min, max)
            // mainAxisSize: MainAxisSize.min,

            // main axis alignment: alignment of children on column or row
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            // alignment cross: if row to be column
            crossAxisAlignment: CrossAxisAlignment.stretch,

            // direction of children
            // verticalDirection: VerticalDirection.up,

            children: /* [
              Container(
                //margin is gaps outside element => EdgeInsets.function : function => all, symmetric, fromLTRB, only..
                //padding is gaps inside element => EdgeInsets.function : function => all...
                // margin: EdgeInsets.fromLTRB(50, 30, 10, 15),
                // padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                width: 100,
                height: 100,
                child: Text("container 1"),
              ),
          
            ],
          */

                // BoxSize is like Container example use to create container between containers

                a,
          ),
        ),
      ),
    );
  }

  List<Container> createBox(int n) {
    List<Container> list = [];
    // double infinity is infinity width (to edge of screen)
    for (int i = 0; i < n; i++) {
      var clr;
      double w = 0;
      if (i.isEven) {
        clr = Colors.red;
        w = 200;
      } else {
        clr = Colors.amber;
        w = 100;
      }
      Container con = Container(
        color: clr,
        width: w,
        height: 100,
        child: Text("Container ${i + 1}"),
        // margin: EdgeInsets.only(bottom: 10),
      );
      list.add(con);
    }
    return list;
  }
}
