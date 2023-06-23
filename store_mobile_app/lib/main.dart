// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart'; // material
import 'package:google_fonts/google_fonts.dart'; // google fonts
import 'package:store_mobile_app/screens/home_screen.dart'; // first screen (home screen)
import 'package:store_mobile_app/constants.dart'; // import constants
import 'package:flutter_localizations/flutter_localizations.dart'; // arabic rtl direction of text

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electrical store mobile app',
      // theme data
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: kPrimaryColor),
      ),
      // Arabic RTL
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("ar", "AE")],
      locale: Locale("ar", "AE"),

      // first screen of app (home)
      home: HomeScreen(),
    );
  }
}
