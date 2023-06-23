// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/category_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        // width / height of element
        childAspectRatio: 7 / 8,
        // gap between elements (horizontal)
        mainAxisSpacing: 10,
        // gap between elements (vertical)
        crossAxisSpacing: 10,
      ),
      children: Categories_Data.map(
        (categoryDate) => CategoryItem(
          id: categoryDate.id,
          title: categoryDate.title,
          imageUrl: categoryDate.imageUrl,
        ),
      ).toList(),
    );
  }
}
