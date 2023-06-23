// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import '../app_data.dart';
import '../models/trip.dart';
import '../screens/filters_screen.dart';
// direction of app
import 'package:flutter_localizations/flutter_localizations.dart';
import '../screens/category_trips_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      // add new direction of app
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', "AE"), // arabic / country
      ],
      theme: ThemeData(
        // main color
        primarySwatch: Colors.blue,
        // second color
        hintColor: Colors.amber,
        fontFamily: "ElMessiri",
        // change theme of text
        textTheme: ThemeData.light().textTheme.copyWith(
              // was headline5
              headlineSmall: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: "ElMessiri",
                fontWeight: FontWeight.bold,
              ),
              // was headline6
              titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: "ElMessiri",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      // screens of app
      // map : key, value
      // key: like path of screen "/nameOfScreen"
      // "/path": context => screenWidget
      routes: {
        // '/' is mean "home" property or can use "initialRoute"
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) =>
            TripDetailScreen(_manageFavorite, _isFavorite),
        FilterScreen.screenRoute: (ctx) =>
            FilterScreen(_filters, _changeFilters),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
