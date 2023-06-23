// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  final Function manageFavorite;
  final Function isFavorite;

  TripDetailScreen(this.manageFavorite, this.isFavorite);

  static const screenRoute = '/trip-detail';

  // title of section
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  // list view
  Widget buildListViewContainer(Widget list) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "الأنشطة"),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "البرنامج اليومي"),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("يوم ${index + 1}"),
                      ),
                      title: Text(
                        selectedTrip.program[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isFavorite(tripId) ? "إزالة من المفضلة" : "إضافة إلى المفضلة",
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => manageFavorite(tripId),
      ),
    );
  }
}
