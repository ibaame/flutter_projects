import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_mobile_app/constants.dart';
import 'package:store_mobile_app/widgets/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: homeAppBar(),
      body: HomeBody(),
    );
  }

  // app bar method
  AppBar homeAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        "مرحبا بكم",
        style: GoogleFonts.getFont("Almarai"),
      ),
      centerTitle: false, // to left
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }
}
