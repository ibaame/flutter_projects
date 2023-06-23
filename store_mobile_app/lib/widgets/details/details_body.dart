// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store_mobile_app/constants.dart';
import 'package:store_mobile_app/models/product.dart';
import 'package:store_mobile_app/widgets/details/color_dot.dart';
import 'package:store_mobile_app/widgets/details/product_image.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the screen
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              Center(
                child: ProductImage(
                  size: size,
                  image: product.image,
                ),
              ),
              // dots
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                // colors of image
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ColorDot(
                      fillColor: Colors.grey,
                      isSelected: true,
                    ),
                    ColorDot(
                      fillColor: Colors.blue,
                      isSelected: false,
                    ),
                    ColorDot(
                      fillColor: Colors.red,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              // title
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              // price
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text("السعر \$${product.price}",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: kSecondaryColor)),
              ),
            ],
          ),
        ),
        // description
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding / 2),
          child: Text(
            product.description,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ],
    );
  }
}
