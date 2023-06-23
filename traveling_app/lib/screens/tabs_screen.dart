// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  List<Map<String, Widget>> _screens = [];

  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': Text('تصنيفات الرحلات'),
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': Text('الرحلات المفضلة'),
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectedScreenIndex]['Title'],
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).hintColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        // List with two values (index: 0 , 1)
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة",
          ),
        ],
      ),
    );
  }
}
