import 'package:flutter/material.dart';
import 'package:store_mobile_app/constants.dart';

class ProductImage extends StatelessWidget {
  ProductImage({
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width * 0.8,
      child: Stack(
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          Image.asset(
            image,
            width: size.width * 0.75,
            height: size.width * 0.75,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
