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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[700],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/logo.jpg"),
              ),
              Text(
                "بسام محمد",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontFamily: "Cairo",
                ),
              ),
              Text(
                "مبرمج تطبيقات",
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  // ignore: prefer_const_literals_to_create_immutables
                  leading: Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.cyan,
                  ),
                  title: Text(
                    "+966 500000000",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  // ignore: prefer_const_literals_to_create_immutables
                  leading: Icon(
                    Icons.email,
                    size: 20,
                    color: Colors.cyan,
                  ),
                  title: Text(
                    "hello@gmail.com",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
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
