// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// direct of app
import '../screens/home.dart';
import '../screens/decimal_to_binary.dart';
import '../screens/binary_to_decimal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Convert Text",
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', "AE"),
      ],
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                color: Color(0xfff1faee),
              ),
            ),
      ),
      routes: {
        '/': (ctx) => Home(),
        DecimalToBinary.screenRoute: (ctx) => DecimalToBinary(),
        BinaryToDecimal.screenRoute: (ctx) => BinaryToDecimal(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
