// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  static const routeScreen = "/filter_screen";

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filter(this.currentFilters, this.saveFilters);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  // default values of switch
  var _cool = false;
  var _warm = false;
  var _main = false;
  var _shade300 = false;
  var _shade200 = false;
  var _shade100 = false;

  // to save values when exist of filter screen
  @override
  void initState() {
    _cool = widget.currentFilters['cool'] as bool;
    _warm = widget.currentFilters['warm'] as bool;
    _main = widget.currentFilters['main'] as bool;
    _shade300 = widget.currentFilters['shade300'] as bool;
    _shade200 = widget.currentFilters['shade200'] as bool;
    _shade100 = widget.currentFilters['shade100'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Filter")),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print("filter screen");
              final selectedFilters = {
                'cool': _cool,
                'warm': _warm,
                'main': _main,
                'shade300': _shade300,
                'shade200': _shade200,
                'shade100': _shade100,
              };
              // pass values with _receiveFilters method
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text("cool color"),
              subtitle: Text("appear only cool color"),
              trailing: Switch(
                value: _cool,
                onChanged: (newValue) {
                  setState(() {
                    _cool = newValue;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("warm color"),
              subtitle: Text("appear only warm color"),
              trailing: Switch(
                value: _warm,
                onChanged: (newValue) {
                  setState(() {
                    _warm = newValue;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("main color"),
              subtitle: Text("appear only main color"),
              trailing: Switch(
                value: _main,
                onChanged: (newValue) {
                  setState(() {
                    _main = newValue;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("shade-300"),
              subtitle: Text("only color contain shade-300"),
              trailing: Switch(
                value: _shade300,
                onChanged: (newValue) {
                  setState(() {
                    _shade300 = newValue;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("shade-200"),
              subtitle: Text("only color contain shade-200"),
              trailing: Switch(
                value: _shade200,
                onChanged: (newValue) {
                  setState(() {
                    _shade200 = newValue;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("shade-100"),
              subtitle: Text("only color contain shade-100"),
              trailing: Switch(
                value: _shade100,
                onChanged: (newValue) {
                  setState(() {
                    _shade100 = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
