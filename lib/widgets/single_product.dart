import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;

  const SingleProduct({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12.0),
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "\$$price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
