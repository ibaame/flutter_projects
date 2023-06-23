// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store_mobile_app/constants.dart';
import 'package:store_mobile_app/models/product.dart';
import 'package:store_mobile_app/widgets/details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBody(product: product,),
    );
  }

  // app bar of details screen
  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "رجوع",
        style: Theme.of(context).textTheme.bodyText2,
      ),
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultPadding),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: kPrimaryColor,
      ),
    );
  }
}
