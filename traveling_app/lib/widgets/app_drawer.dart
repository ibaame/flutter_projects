// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile(
      BuildContext ctx, String title, IconData icon, String screenRoute) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Elmessiri",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(ctx).pushReplacementNamed(screenRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            context,
            "الرحلات",
            Icons.card_travel,
            '/',
          ),
          buildListTile(
            context,
            "التصفية",
            Icons.filter_list,
            FilterScreen.screenRoute,
          ),
        ],
      ),
    );
  }
}
