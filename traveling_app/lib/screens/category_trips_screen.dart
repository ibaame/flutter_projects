// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  // can use this way because if change path name don't need update all path
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  dynamic categoryTitle = "";
  List<Trip> displayTrips = [];

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  void didChangeDependencies() {
    // ModalRoute as Map
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArgument['id'];
    categoryTitle = routeArgument['title'];

    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  // body
  Widget Body() {
    if (displayTrips.isEmpty) {
      return Center(
        child: Text(
          "لا توجد رحلات لهذه الفئة",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Body(),
    );
  }
}
