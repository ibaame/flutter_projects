// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  // final Function removeItem;

  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    // required this.removeItem,
  });

  // create getter by use 'get' keyword
  // getter for enum of season
  String get seasonText {
    switch (season) {
      case Season.Winter:
        return "شتاء";
      case Season.Spring:
        return "ربيع";
      case Season.Summer:
        return "صيف";
      case Season.Autumn:
        return "خريف";
      default:
        return "غير معروف";
    }
  }

  // getter for enum of tripType
  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return "استكشاف";
      case TripType.Recovery:
        return "نقاه";
      case TripType.Activities:
        return "انشطة";
      case TripType.Therapy:
        return "معالجة";
    }
  }

  // getter for iconType
  IconData iconSeason() {
    switch (season) {
      case Season.Winter:
        return Icons.ac_unit;
      case Season.Spring:
        return Icons.local_florist;
      case Season.Summer:
        return Icons.sunny;
      case Season.Autumn:
        return Icons.air;

      default:
        return Icons.sunny;
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailScreen.screenRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result); // result of pop
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    // color gradient
                    gradient: LinearGradient(
                      // direction of color
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // colors
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      // start and end of color
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration أيام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        iconSeason(),
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
