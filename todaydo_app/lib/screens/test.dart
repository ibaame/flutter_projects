// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  static String routeScreen = '/test';

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String name = "";
  String id = "";
  String year = "";
  Map<String, dynamic> user = {
    'id': '000',
    'name': 'not found',
    'year': '0000',
  };
  String searchID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test screen'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          id = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'ID',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          name = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'name',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          year = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'year',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${user['id']} - ${user['name']} - ${user['year']}',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    saveMyInfo();
                  },
                  child: Text('add new user'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      searchID = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter  id',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    removeMyInfo(searchID);
                  },
                  child: Text('delete user'),
                ),
                TextButton(
                  onPressed: () {
                    getMyInfo(searchID);
                  },
                  child: Text('show info'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // to save objects in the local device
  // convert map to String by json.encode
  // convert String to map by json.decode
  Future<void> saveMyInfo() async {
    final pref = await SharedPreferences.getInstance();
    var info = {'name': name, 'year': year};
    String toString = json.encode(info);
    pref.setString(id, toString);
  }

  Future<void> getMyInfo(String id) async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      String fromString = pref.getString(id) ?? "not found";
      if (fromString != "not found") {
        var info = json.decode(fromString);
        user = {'id': id, 'name': info['name'], 'year': info['year']};
      } else {
        user = {'id': id, 'name': 'not found', 'year': '0000'};
      }
    });
  }

  Future<void> removeMyInfo(String id) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(id);
  }
}
