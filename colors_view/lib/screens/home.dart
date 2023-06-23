import 'package:flutter/material.dart';

import '../screens/filter.dart';
import '../screens/view.dart';
import '../screens/apply.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Colors"),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, View.routeScreen);
                    },
                    child: const Card(
                      color: Colors.redAccent,
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Filter.routeScreen);
                    },
                    child: const Card(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          "Filter",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Apply.routeScreen);
                    },
                    child: const Card(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          "Test",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
