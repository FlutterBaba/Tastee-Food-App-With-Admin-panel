import 'package:flutter/material.dart';

import 'package:tasteefood/pages/detailPage/components/second_part.dart';
import 'package:tasteefood/pages/detailPage/components/top_part.dart';

class DetailsPage extends StatelessWidget {
  final String productImage;
  final String productName;
  final double productPrice;
  final double productOldPrice;
  final int productRate;

  const DetailsPage({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productOldPrice,
    required this.productRate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopPart(
              productImage: productImage,
            ),
            SecondPart(
              productName: productName,
              productOldPrice: productOldPrice,
              productPrice: productPrice,
              productRate: productRate,
            ),
          ],
        ),
      ),
    );
  }
}
